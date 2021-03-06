/*
 * Copyright 2018 Space Dynamics Laboratory - Utah State University Research Foundation.
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
package edu.usu.sdl.openstorefront.core.model.search;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rfrazier
 */
public class AdvancedSearchMetaData
{
	private List<ResultTypeStat> resultTypeStats = new ArrayList<>();
	private List<ResultTagStat> resultTagStats = new ArrayList<>();
	private List<ResultOrganizationStat> resultOrganizationStats = new ArrayList<>();
	private List<ResultAttributeStat> resultAttributeStats = new ArrayList<>();
	
	public AdvancedSearchMetaData()
	{
	}

	public List<ResultTypeStat> getResultTypeStats()
	{
		return resultTypeStats;
	}

	public void setResultTypeStats(List<ResultTypeStat> resultTypeStats)
	{
		this.resultTypeStats = resultTypeStats;
	}

	public List<ResultTagStat> getResultTagStats()
	{
		return resultTagStats;
	}

	public void setResultTagStats(List<ResultTagStat> resultTagStats)
	{
		this.resultTagStats = resultTagStats;
	}

	public List<ResultOrganizationStat> getResultOrganizationStats()
	{
		return resultOrganizationStats;
	}

	public void setResultOrganizationStats(List<ResultOrganizationStat> resultOrganizationStats)
	{
		this.resultOrganizationStats = resultOrganizationStats;
	}

	public List<ResultAttributeStat> getResultAttributeStats()
	{
		return resultAttributeStats;
	}

	public void setResultAttributeStats(List<ResultAttributeStat> resultAttributeStats)
	{
		this.resultAttributeStats = resultAttributeStats;
	}
}
