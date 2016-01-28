<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<stripes:layout-render name="../../../../client/layout/adminlayout.jsp">
    <stripes:layout-component name="contents">

		<script type="text/javascript">
			/* global Ext, CoreUtil */
			Ext.onReady(function () {


				var jobStore = Ext.create('Ext.data.Store', {
					storeId: 'jobStore',
					autoLoad: true,
					proxy: {
						type: 'ajax',
						url: '/openstorefront/api/v1/service/jobs'
					}
				});

				var jobGrid = Ext.create('Ext.grid.Panel', {
					title: 'Jobs',
					id: 'jobGrid',
					store: jobStore,
					columnLines: true,
					columns: [
						{text: 'Job Name', dataIndex: 'jobName', flex: 1}
					],
					dockedItems: [
					],
					listeners: {
						itemdblclick: function (grid, record, item, index, e, opts) {
						},
						selectionchange: function (grid, record, eOpts) {
							if (Ext.getCmp('jobGrid').getSelectionModel().hasSelection()) {


							} else {

							}
						}
					}
				});

				var taskStore = Ext.create('Ext.data.Store', {
					storeId: 'taskStore',
					autoLoad: true,
					proxy: {
						type: 'ajax',
						url: '/openstorefront/api/v1/service/jobs/tasks/status'
					}
				});


				var taskGrid = Ext.create('Ext.grid.Panel', {
					title: 'Tasks',
					id: 'taskGrid',
					store: taskStore,
					columnLines: true,
					columns: [
						{text: 'Task Name', dataIndex: 'taskName', flex: 1}
					],
					dockedItems: [
					],
					listeners: {
						itemdblclick: function (grid, record, item, index, e, opts) {
						},
						selectionchange: function (grid, record, eOpts) {
							if (Ext.getCmp('taskGrid').getSelectionModel().hasSelection()) {


							} else {

							}
						}
					}
				});

				var jobsMainPanel = Ext.create('Ext.tab.Panel', {
					title: 'Manage Jobs <i class="fa fa-question-circle"  data-qtip="Control and view scheduled jobs and background tasks."></i>',
					width: 400,
					height: 400,
					items: [jobGrid, taskGrid]
				});

				Ext.create('Ext.container.Viewport', {
					layout: 'fit',
					items: [
						jobsMainPanel
					]
				});



			});

		</script>
    </stripes:layout-component>
</stripes:layout-render>