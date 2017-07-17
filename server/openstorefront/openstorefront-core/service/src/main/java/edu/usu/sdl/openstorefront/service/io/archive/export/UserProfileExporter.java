/*
 * Copyright 2017 Space Dynamics Laboratory - Utah State University Research Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.usu.sdl.openstorefront.service.io.archive.export;

import com.fasterxml.jackson.core.type.TypeReference;
import edu.usu.sdl.openstorefront.common.util.StringProcessor;
import edu.usu.sdl.openstorefront.core.entity.UserProfile;
import edu.usu.sdl.openstorefront.service.io.archive.BaseExporter;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.java.truevfs.access.TFile;
import net.java.truevfs.access.TFileInputStream;
import net.java.truevfs.access.TFileOutputStream;

/**
 *
 * @author dshurtleff
 */
public class UserProfileExporter
		extends BaseExporter
{

	private static final Logger LOG = Logger.getLogger(UserProfileExporter.class.getName());
	private static final String DATA_DIR = "/userprofiles/";

	@Override
	public int getPriority()
	{
		return 18;
	}

	@Override
	public String getExporterSupportEntity()
	{
		return UserProfile.class.getSimpleName();
	}

	@Override
	public List<BaseExporter> getAllRequiredExports()
	{
		List<BaseExporter> exporters = new ArrayList<>();
		exporters.add(this);
		return exporters;
	}

	@Override
	public long getTotalRecords()
	{
		UserProfile userProfileExample = new UserProfile();
		userProfileExample.setActiveStatus(UserProfile.ACTIVE_STATUS);
		return service.getPersistenceService().countByExample(userProfileExample);
	}

	@Override
	public void exportRecords()
	{
		UserProfile userProfileExample = new UserProfile();
		userProfileExample.setActiveStatus(UserProfile.ACTIVE_STATUS);
		List<UserProfile> userProfiles = userProfileExample.findByExample();

		File userProfileFile = new TFile(archiveBasePath + DATA_DIR + "userProfiles.json");

		try (OutputStream out = new TFileOutputStream(userProfileFile)) {
			StringProcessor.defaultObjectMapper().writeValue(out, userProfiles);
		} catch (IOException ex) {
			LOG.log(Level.WARNING, MessageFormat.format("Unable to export userProfiles.{0}", ex));
			addError("Unable to export userProfiles");
		}

		archive.setRecordsProcessed(archive.getRecordsProcessed() + userProfiles.size());
		archive.setStatusDetails("Exported " + userProfiles.size() + " userProfiles");
		archive.save();
	}

	@Override
	public void importRecords()
	{
		File dataDir = new TFile(archiveBasePath + DATA_DIR);
		File files[] = dataDir.listFiles();
		if (files != null) {
			for (File dataFile : files) {
				try (InputStream in = new TFileInputStream(dataFile)) {
					archive.setStatusDetails("Importing: " + dataFile.getName());
					archive.save();

					List<UserProfile> userProfiles = StringProcessor.defaultObjectMapper().readValue(in, new TypeReference<List<UserProfile>>()
					{
					});
					for (UserProfile userProfile : userProfiles) {
						service.getUserService().saveUserProfile(userProfile);
					}

					archive.setRecordsProcessed(archive.getRecordsProcessed() + userProfiles.size());
					archive.save();

				} catch (Exception ex) {
					LOG.log(Level.WARNING, "Failed to Load userProfiles", ex);
					addError("Unable to load userProfiles: " + dataFile.getName());
				}
			}
		} else {
			LOG.log(Level.FINE, "No userProfiles to load.");
		}
	}

}
