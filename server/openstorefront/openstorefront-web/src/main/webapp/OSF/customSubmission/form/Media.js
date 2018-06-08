/* 
 * Copyright 2018 Space Dynamics Laboratory - Utah State University Research Foundation.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * See NOTICE.txt for more information.
 */
/* global Ext, CoreUtil, CoreService */

/* Author: cyearsley */

Ext.define('OSF.customSubmission.form.Media', {
	extend: 'OSF.customSubmission.SubmissionBaseForm',
	xtype: 'osf-submissionform-media',
	
	layout: 'anchor',
	bodyStyle: 'padding: 10px',
	fieldType: 'MEDIA',

	defaults: {
		width: '100%',
		maxWidth: 800,
		labelAlign: 'top',
		labelSeparator: ''		
	},	
	
	initComponent: function () {
		this.callParent();
		
		var mediaPanel = this;

		mediaPanel.add([
			{
				xtype: 'StandardComboBox',
				itemId: 'mediaTypeCode',
				name: 'mediaTypeCode',				
				allowBlank: false,
				margin: '0 0 15 0',
				editable: false,
				typeAhead: false,
				fieldLabel: 'Media Type: <span class="field-required" />',
				labelAlign: 'left',
				storeConfig: {
					url: 'api/v1/resource/lookuptypes/MediaType'
				}
			},
			{
				xtype: 'textfield',
				fieldLabel: 'Caption <span class="field-required" />',
				allowBlank: false,
				maxLength: '255',
				name: 'caption'
			},
			{
				xtype: 'checkbox',
				boxLabel: '<strong>Hide In Carousel</strong>',
				name: 'hideInDisplay',
				colName: 'hideInCarousel'
			},
			{
				xtype: 'checkbox',
				boxLabel: '<strong>Used Inline</strong>',
				name: 'usedInline'
			},
			{
				xtype: 'checkbox',
				boxLabel: '<strong>Icon</strong> <i class="fa fa-question-circle"  data-qtip="Designates a media item to be used as an icon. There should only be one active on a entry at a time."></i>',
				name: 'iconFlag',
				colName: 'showIcon'
			},
			{
				xtype: 'button',
				text: 'Local Resource',
				margin: '0 0 15 0',
				menu: [
					{
						text: 'Local Resource',
						handler: function () {
							var form = this.up('form');
							var button = this.up('button');
							button.setText('Local Resource');
							form.getForm().findField('file').setHidden(false);
							form.getForm().findField('originalLink').setHidden(true);
							
							form.query('[name="iconFlag"]')[0].setDisabled(false);
						}
					},
					{
						text: 'External Link',
						handler: function () {
							var form = this.up('form');
							var button = this.up('button');
							button.setText('External Link');
							form.getForm().findField('file').setHidden(true);
							form.getForm().findField('originalLink').setHidden(false);
							
							form.query('[name="iconFlag"]')[0].setDisabled(true);
						}
					}
				]
			},
			{
				xtype: 'fileFieldMaxLabel',
				itemId: 'upload',
				name: 'file',
				colName: 'filePath',
				resourceLabel: 'Upload Media'
			},
			{
				xtype: 'textfield',
				fieldLabel: 'Link',
				hidden: true,
				maxLength: '255',
				emptyText: 'http://www.example.com/image.png',
				name: 'originalLink',
				colName: 'externalLink'
			},
			{
				xtype: 'SecurityComboBox'
			},
			{
				xtype: 'DataSensitivityComboBox'
			}
		]);
		
		if (mediaPanel.section) {
			var initialData = mediaPanel.section.submissionForm.getFieldData(mediaPanel.fieldTemplate.fieldId);
			if (initialData) {
				var data = Ext.decode(initialData);
				var record = Ext.create('Ext.data.Model', {				
				});
				record.set(data[0]);
				mediaPanel.loadRecord(record);			
			}			
		}		
		
	},
	getSubmissionValue: function() {		
		var mediaPanel = this;
		
		//Add handling of the local resources
		
		var data = mediaPanel.getValues();
		
		var userSubmissionField = {			
			templateFieldId: mediaPanel.fieldTemplate.fieldId,
			rawValue: Ext.encode([
				data
			])
		};		
		return userSubmissionField;	
	}	
	
});
