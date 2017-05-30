/* 
 * Copyright 2017 Space Dynamics Laboratory - Utah State University Research Foundation.
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

/* global Ext, CoreUtil */

Ext.define('OSF.landing.OrganizationSearch', {
	
	handler: function(record) {
		var searchConfig = this;		
		if (!searchConfig.view) {
			searchConfig.view = Ext.create('OSF.landing.OrganizationSearchView', {				
			});
		}	
		searchConfig.view.show();
	}
	
});

Ext.define('OSF.landing.OrganizationSearchView', {
	extend: 'Ext.window.Window',
	alias: 'widget.osf-organizationview',
		
	width: '70%',
	height: '70%',	
	modal: true,
	title: 'Organizations',
	iconCls: 'fa fa-lg fa-sitemap',
	layout: 'fit',
	dockedItems: [
		{
			xtype: 'toolbar',
			dock: 'top',
			items: [
				{
					xtype: 'textfield',
					name: 'filter',
					fieldLabel: 'Filter',
					width: '100%',					
					listeners: {
						change: function(field, newValue, oldValue, opts) {
							var orgWin = field.up('window');
							var store = orgWin.queryById('dataview').getStore();
							store.clearFilter();
							store.filterBy(function(record) {
								return Ext.String.startsWith(record.get('name'), newValue, true);
							});
						}
					}
				}
			]
		}
	],
	items: [
		{
			xtype: 'dataview',
			itemId: 'dataview',
			scrollable: true,
			store: {
				autoLoad: true,
				sorters: [{
					property: 'name',
					direction: 'ASC'
				}],				
				proxy: {
					type: 'ajax',
					url: 'api/v1/resource/organizations?componentOnly=true',
					reader: {
						type: 'json',
						rootProperty: 'data',
						totalProperty: 'totalNumber'
					}
				}
			},
			itemSelector: 'div.search-tool',			
			tpl: new Ext.XTemplate(
				'<tpl for=".">',					
					'<div class="search-tool-org">',
						'<div class="search-tool-org-logo">',
							'<tpl if="logo"><img src="{logo}" height=50 /></tpl>',	
						'</div>',
						'<div class="search-tool-org-text">',							
							'<a href="#" onclick="CoreUtil.pageActions.orgizationSearch(\'{name}\');" class="search-tool-org-text-name link">{name}</a><br>',
							'<span class="search-tool-org-text-desc">{description}</span>',
						'</div>',
					'</div>',
				'</tpl>'
			),
			listeners: {
				itemclick: function(dataView, record, item, index, e, eOpts) {	
					if (!record.tool) {
						record.tool = Ext.create(record.data.toolType, {							
						});
					}
					record.tool.handler(record, item);
				}
			}
		}
	],
	initComponent: function () {
		this.callParent();			
		var	orgView = this;
		
		CoreUtil.pageActions.orgizationSearch = function(name) {
			
			var searchObj = {
				"sortField": null,
				"sortDirection": "ASC",
				"startOffset": 0,
				"max": 2147483647,
				"searchElements": [{
						"searchType": "COMPONENT",
						"field": "organization",
						"value": name,
						"keyField": null,
						"keyValue": null,
						"startDate": null,
						"endDate": null,
						"caseInsensitive": false,
						"numberOperation": "EQUALS",
						"stringOperation": "EQUALS",
						"mergeCondition": "OR"
					}]
			};

			var searchRequest = {
				type: 'Advance',
				query: searchObj
			};

			CoreUtil.sessionStorage().setItem('searchRequest', Ext.encode(searchRequest));
			window.location.href = 'searchResults.jsp';				
			
		};
		
	}
	
});
