<%--
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
 --%>

<script type="text/javascript">
	Ext.require('OSF.landing.DefaultHeader');
	Ext.require('OSF.landing.DefaultFooter');
	Ext.require('OSF.landing.DefaultSearch');

	Ext.onReady(function(){


		Ext.create('Ext.container.Viewport', {
			cls: 'home-backsplash',
			layout: 'border',
			items: [
				{
					xtype: 'osf-defaultheader'
				},
				{
					xtype: 'panel',
					region: 'center',
					scrollable: true,
					items: [
						{
							xtype: 'osf-defaultsearch',
							bodyStyle: 'padding-top: 80px; padding-bottom: 40px;'
						},
						{
							xtype: 'osf-defaultfooter'
						},
						{
							xtype: 'panel',
							width: '100%',
							layout: 'center',
							bodyCls: 'home-footer',
							bodyStyle: 'padding: 20px 0px 20px 0px;',
							items: [
								{
									html: '<div class="home-footer-version">${actionBean.appVersion}</div>'
								}
							]
						}	
					]
				}

			]
		});

	});	

</script>