/*
Copyright 2016 Space Dynamics Laboratory - Utah State University Research Foundation.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

<%@page  contentType="text/css" %>


@media print {
    .pageBreak {		
		page-break-after: always;
	}
    .hidePrint{
		display: none;
	}
	.pushToTop{
		margin-top: -50px;
	}	
}

.printBody{
		background: white !important;
		overflow: visible;
}

.browser-warning{
	display: none;
    opacity: 0.8;
    z-index: 10000;
    position: absolute;
    bottom: 0px;
    left: 0px;
    padding-left: 20px;
    padding-right: 20px;
    width: 100%;
    height: 50px;
    background-color: #cc0000;
    color: white;
    text-shadow: 1px 1px 2px black;
}

.browser-warning-link {
	color: lime;
}

.browser-warning-link:visited {
	color: lime;
}

.browser-warning-link:hover, .browser-warning-link:focus {	
	text-decoration: underline;
}


.action-icon {
	font-size: 16px;
}

.link {
    color: ${actionBean.branding.linkColor};
    text-decoration: none;	
}

.link:visited {
    color: ${actionBean.branding.linkVisitedColor};
    text-decoration: none;	
}

.link:hover, .link:focus {
  color: ${actionBean.branding.linkhoverColor};
  text-decoration: underline;
}

.link:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}

.homelink {
    color: whitesmoke;
    text-decoration: none;	
}

.homelink:visited {
    color: whitesmoke;
    text-decoration: none;	
}

.homelink:hover, .link:focus {
  color: yellow;
  text-decoration: underline;
}

.homelink:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}

.linkItem:hover {
	cursor: pointer;
}

.hidden {
	display: none;
	visibility: hidden;
}

.small-button-normal {
	padding: 5px;
    border: 1px solid grey;
    border-radius: 2px 2px 2px 2px;
    color: black;
}

.small-button-normal:hover {
	background-color: lightgrey;
	cursor: pointer;
}

.small-button-normal:pressed {
	background-color: darkgrey;
	cursor: pointer;
}

.small-button-danger {
	padding: 5px;
    border: 1px solid grey;
    border-radius: 2px 2px 2px 2px;
    color: red;	
}

.small-button-danger:hover {
	background-color: lightgrey;
	cursor: pointer;
}

.small-button-danger:pressed {
	background-color: darkgrey;
	cursor: pointer;
}

.page-title{
	text-align: center; 
	font-size: 35px; 
	font-family: Calibri; 
	color: ${actionBean.branding.primaryTextColor};
}

.security-banner {
	text-align: center;
	font-size: 14px; 
	font-weight: bold;
	background-color: ${actionBean.branding.securityBannerBackgroundColor};
	color: ${actionBean.branding.securityBannerTextColor};
}

.nav-back-color {
    min-height: 52px;
 /*  background-color: #414e68; */
    border-color: #343f54;
    background: ${actionBean.branding.primaryColor};
}
.nav-back-color-only {
	background-color: ${actionBean.branding.primaryColor};
}

.accent-background {
	background-color: ${actionBean.branding.accentColor};
}

.border_accent {
	border-bottom: 3px solid ${actionBean.branding.accentColor};
}

.home-quote-banner-section{
	background: ${actionBean.branding.quoteColor} !important;
}

.home-quote-banner-text{	
	font-size: 19px;
	font-style:  italic;
	font-family: Georgia, serif;
	color: ${actionBean.branding.primaryTextColor} !important;
}

.home-search-panel {
	background: white;
	padding: 40px 0px 40px 0px;
	border-top: 1px solid darkgray !important;
	border-bottom: 1px solid lightgray !important;
}

.new-home-search-panel {
	background: url('${pageContext.request.contextPath}/images/footer_lodyas.png');
	padding: 40px 0px 0px 0px;
	border-top: 1px solid darkgray !important;
	/* border-bottom: 1px solid lightgray !important; */
}
.new-home-highlight-panel {
	background: url('${pageContext.request.contextPath}/images/footer_lodyas.png');
}

.home-search-field {
	font-size: 2.4em;
	line-height: 1.428571429;
	color: #555555;
	vertical-align: middle;
	background-color: white;
	background-image: none;
	border: 1px solid #cccccc;
	/* border-left: 0px; */
	border-right: 0px;	
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	-webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
	transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;		
}

.home-search-stats {
	color: #999999;
	font-size: 21px;
	padding-bottom: 10px;
}

.home-footer {
	background-color: ${actionBean.branding.primaryColor};	
}

.new-home-footer {
	background: url('${pageContext.request.contextPath}/images/footer_lodyas.png');
}

.home-footer-contents {	
	color: ${actionBean.branding.primaryTextColor};
}

.home-footer-version {
	color: ${actionBean.branding.primaryTextColor};
}

.searchresults-morefilter {
	color: white;
	background-color: ${actionBean.branding.primaryColor};
}

.searchresults-item:nth-child(odd){
	background: white;
	padding: 10px;
	border: 1px solid lightgray;
	margin-top: -1px;
}

.searchresults-item:nth-child(even){
	background: whitesmoke;
	padding: 10px;
	border: 1px solid lightgray;
	margin-top: -1px;
}

.searchresults-item-update{
	font-size: 10px;
	color: darkgray;
}

.searchresults-item-org {
	font-size: 12px;
	color: grey;
}

.searchresults-item-click {
	margin: 0px;
	padding-top: 15px;
	padding-bottom: 15px;
}

.searchresults-item-click:hover{
	background: #d8e9f6;
	cursor: pointer;
}

.searchresults-tag{
	border: 1px solid lightgray;
	border-radius: 5px 5px 5px 5px;
	background: ${actionBean.branding.primaryColor};
	color: white;
	font-weight: bold;
	padding: 5px;
	line-height: 28px;
}

.details-title-name {
	font-size: 36px;
	line-height: 28px;
	color: ${actionBean.branding.primaryColor} !important;
	padding-top: 10px;
	padding-bottom: 10px;
}

.details-title-info {
	color: rgba(68,30,90,.6) !important;
}

.review-summary-rating {
	font-size: 20px;
}

.review-pro-con-header{
	font-weight: bold;
	width: 100%;	
	padding: 5px 0px 5px 5px;
	background-color: beige;
	border-bottom: 1px solid lightgrey;
}

.rating-star-color {
	color: gold;
}

.review-who-section {
	color: darkgray;
}

.review-summary-count {
	color: #999;
	font-size: 11px;
}

.question-question {
	font-size: 16px;
}

.question-response {
	font-weight: bold;
    font-size: 14px;
}

.question-response-letter {
	color: #414e68;
    font-weight: bold;
    font-size: 20px;
}

.question-response-letter-q {
    font-weight: bold;
    font-size: 20px;	
}

.question-info {
	color: #999;
}

.details-table {
	 border-collapse: collapse;
	 border: 1px solid grey;	 
}

th.details-table {
	background-color: #BFBFBF;
	border: 1px solid grey;
	padding: 5px;
	text-align: left;	
}

a.details-table {	
    color: #555555;
	border: 0px;
	text-decoration: none;
}

a.details-table:hover  {	
    color: #2f2f2f;
	text-decoration: underline;
}

td.details-table {
	border: 1px solid grey;
	padding: 5px;
	text-align: left;
}

tr.details-table:hover {
	background-color: #f5f5f5
}

.info-table{
	 border-collapse: collapse;
	 border: 1px solid grey;	
	 width: 100%;
}

tr.info-table:nth-child(even){
	background-color: #f5f5f5;
}

td.info-table {
	border: 1px solid grey;
	padding: 5px;
	text-align: left;
}


.rolling-container {
    width: 100%;        
}

.detail-eval-item {    
	padding: 5px;
	border: 1px solid grey;
	min-width: 311px;
	max-width: 100%;
	width: 16.7%;
	border-collapse: collapse;
}

.detail-eval-item:hover  { 
	background-color: #f5f5f5;
}

.rolling-container-block {    
    float: left;		
}

.detail-eval-label{	
	min-width: 100px;
	font-weight: bold;
}

.detail-eval-score{
	float: right;
	width: 60px;
	color: #021233;
}

.detail-media-block{
	padding: 5px;
	border: 1px solid grey;
	height: 163px;
    float: left;	
	margin-right: 5px;
    margin-top: 5px;	
}

.detail-media-block-quick{
	padding: 5px;
	border: 1px solid grey;
	height: 163px;
    float: left;	
	margin-right: 5px;
    margin-top: 5px;	
}

.detail-media-block:hover{
	background-color: lightgrey;
	cursor: pointer;	
}

.detail-media-caption{
	background: black;
    color: white;
    margin-top: -35px;
    padding: 5px;
    position: relative;
    bottom: 0;
    opacity: .6;
    width: 100%;	
    text-align: center;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;	
}

.mediaviewer-body{
	background-color: rgba(0, 0, 0, .6);
}

@media (min-width: 800px) {
	.footer_content {
		margin: 0px auto;
		white-space: nowrap;
		width: 800px;
		padding-left: 19%;
	}
}

@media (max-width: 800px) {
	.footer_content {
		margin: 0px auto;
		white-space: nowrap;
		width: 800px;
		padding-left: 8%;	
	}
}

.column {
    float: left;
    font-size: 11px;
    color: gray;
    /* margin: 0px 40px 0px; */
	padding-right: 40px;
    text-align: left;
    white-space: nowrap;
}

.column ul {
	list-style: none;
	padding-left: 0px;
}

.column .title {
    font-family: 'Archivo Narrow', sans-serif;
    font-size: 18px;
    font-weight: bold;
    color: #DDDDDD;
}

.copyright {
    margin-top: 10px;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    font-size: 10px;
    color: gray;
}

.footer_content a {
    color: darkgray;
	text-decoration: none;
}

.copyright a {
    color: darkgray;
	text-decoration: none;
}

.home-info-section {
	background: #efefef;
	padding: 20px;
}

.home-info-section-title {
	font-size: 36px;
	text-align: center;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: 500;
	line-height: 1.1;	
}

.home-info-section-title-rule {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid lightgray;
}

.home-highlight-item {
	border: 1px solid lightgrey;
    padding: 5px;
    background: #E4E4E4;	
}

.home-highlight-item-desc {
	padding: 5px;	
}

.new-home-highlight-item {
	text-align: center;
    padding: 5px;
	color: whitesmoke;
}

.new-home-highlight-item-desc {
	padding: 5px;
	color: whitesmoke;	
}


.home-highlight-approved {
	text-align: right;
	font-size: 10px;
}

.logo-small {
    width: 250px;
    padding: 2px;
    text-align: left;
    border-radius: 0px 8px 8px 0px;
    background: -moz-linear-gradient(left, rgba(255,255,255,1) 0%, rgba(255,255,255,1) 81%, rgba(255,255,255,0) 100%);
    background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(255,255,255,1)), color-stop(81%,rgba(255,255,255,1)), color-stop(100%,rgba(255,255,255,0)));
    background: -webkit-linear-gradient(left, rgba(255,255,255,1) 0%,rgba(255,255,255,1) 81%,rgba(255,255,255,0) 100%);
    background: -o-linear-gradient(left, rgba(255,255,255,1) 0%,rgba(255,255,255,1) 81%,rgba(255,255,255,0) 100%);
    background: -ms-linear-gradient(left, rgba(255,255,255,1) 0%,rgba(255,255,255,1) 81%,rgba(255,255,255,0) 100%);
    background: linear-gradient(to right, rgba(255,255,255,1) 0%,rgba(255,255,255,1) 81%,rgba(255,255,255,0) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=1 );
}

.entry-template_block {
	background-color: #45587B;
}

.generated-code {
	background-color: darkslategrey;
	color: white;
	font-weight: bold; 
}

.widget-picklist-item {
	border-bottom: 1px solid lightgrey;
	padding-bottom: 10px;
}

.widget-picklist-item-title {
	font-size: 24px;
	padding: 10px 10px 10px 10px;	
	background-color: #E0E7EF;
}

.widget-picklist-item-title:hover {
	text-decoration: underline;
	cursor: pointer;
}

.widget-picklist-item:nth-child(odd){
	background-color: white;
}

.widget-picklist-item:nth-child(even){
	background-color: whitesmoke;
}

.stat-list-group-item:first-child {
	border-top-right-radius: 4px;
	border-top-left-radius: 4px;
}
.stat-list-group-item {
	position: relative;
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #8A8A8A;
	border: 1px solid #464545;
	font-size: 14px;
	color: white;
}
.stat-list-group {
	/* margin-bottom: 20px; */
	padding-left: 0;
	color: white;
}
ul.stat-list-group-item, ol.stat-list-group-item {
	margin-top: 0;
	margin-bottom: 10.5px;
}
.stat-badge {
	display: inline-block;
	min-width: 10px;
	padding: 3px 7px;
	font-size: 13px;
	font-weight: bold;
	color: ${actionBean.branding.primaryTextColor};
	line-height: 1;
	vertical-align: middle;
	white-space: nowrap;
	text-align: center;
	float: right;
	background-color: ${actionBean.branding.primaryColor};
	border-radius: 10px;
}

.default_body {
	background-color: #f5f5f5;
}

.form-comp-htmleditor-border {
	border:  1px solid lightgrey;
	padding-right: 2px; 
}

.field-required:after {
	color: red;
	font-weight: bold;
	content: "*"
}

.field-label-basic {
	font-weight: bold;
}

.popup-message {
	color:  white;
	opacity: .7;
	background-color: ${actionBean.branding.primaryColor};
}

.icon-top-padding {
	padding-top: 2px !important;
}

.icon-top-padding-5{
	padding-top: 5px !important;
}

.icon-search-adjustment {
	margin-top: -11px;
	margin-left: -5px
}

.icon-color-light {
	color: white
}

/* For icons that don't vertically center for cryptic reasons **/
.icon-vertical-correction {
	margin-top: -5px;
}

/** Search tool styles **/

.list-button {
    background-color: ${actionBean.branding.primaryColor} !important;
    color: #484848;
    border-color: #747679;
    background-image: none;
    text-decoration: none!important;
}

.panel-header {
    background-color: #ababab!important;
    color: black!important;
    border-color: #787878!important;
    border-width: 1px!important;
    background-image:none;
}

.search-tools-column-orange-text {
    color: ${actionBean.branding.primaryColor} !important;
    font-size: 12px;
    font-weight: bold;
}

.search-tools-nav-body-panel-item {
    padding-top:5px;
    padding-bottom:5px;
    padding-left:2px;
    padding-right:2px;
}

.button-danger {
    border-color: #cc0303;
    background-image: none;
    background-color: #ce0000;
    background-image: -webkit-gradient(linear, top, bottom, color-stop(0%, #Ae0000), color-stop(50%, #ce0000), color-stop(51%, #ce0000), color-stop(0%, #Ae0000));
    background-image: -webkit-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -moz-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -o-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -ms-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
}

.app-info-box{
	background-color: ${actionBean.branding.primaryColor};
	padding: 10px;
	height: 100%;
	color: ${actionBean.branding.primaryTextColor};
	margin: 0px 10px 0px 0px;
	float: left;
}

.watch-detail-update {
	border-left: 5px solid green !important;
}

.text-danger {
	color: #a94442;
}

.alert-danger {
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
}

.alert-warning {
    color: #8a6d3b;
    background-color: #fcf8e3;
    border-color: #faebcc;
}

.alert-info {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}

.alert-success {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
}

.highlight-danger {
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
}

.highlight-warning {
    color: #8a6d3b;
    background-color: #fcf8e3;
    border-color: #faebcc;
}

.highlight-info {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}

.highlight-success {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
}

.tinymce-error-field
{
  border: 1px solid red !important;
}

.tinymce-hide-border
{
  border-width: 0px;
}

/**
UI: Button Overrides for specfic buttons
to use set the ui: danger
**/


.x-btn-danger-small {
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 3px;
    padding: 3px 3px 3px 3px;
    border-width: 1px;
    border-style: solid;
    border-color: #cc0303;
    background-image: none;
    background-color: #ce0000;
    background-image: -webkit-gradient(linear, top, bottom, color-stop(0%, #Ae0000), color-stop(50%, #ce0000), color-stop(51%, #ce0000), color-stop(0%, #Ae0000));
    background-image: -webkit-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -moz-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -o-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -ms-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
}

/* http://localhost:1843/classic/theme-base/sass/etc/mixins/frame.scss:237 */
.x-btn-danger-small-mc {
    background-image: url(images/btn/btn-default-small-fbg.gif);
    background-position: 0 top;
    background-color: #cc0303;
}
/* http://localhost:1843/classic/theme-neutral/sass/src/button/Button.scss:445 */
.x-btn-danger-small {
    border-color: #cc0303;
}
/* http://localhost:1843/classic/theme-neutral/sass/src/button/Button.scss:464 */
.x-btn-inner-danger-small {
    font: bold 12px/16px helvetica, arial, verdana, sans-serif;
    color: #fff;
    padding: 0 5px;
    max-width: 100%;
}
/* http://localhost:1843/classic/theme-neutral/sass/src/button/Button.scss:492 */
.x-btn-icon-el-danger-small {
    font-size: 16px;
    height: 16px;
    color: #fff;
    line-height: 16px;
}
/* http://localhost:1843/classic/theme-neutral/sass/src/button/Button.scss:525 */
.x-ie8 .x-btn-icon-el-danger-small.x-btn-glyph {
    color: #fff;
}

/* http://localhost:1843/classic/theme-neutral/sass/src/button/Button.scss:727 */
.x-btn-focus.x-btn-danger-small {
    border-color: #ff0000;
    background-image: none;
    background-color: #ce0000;
    background-image: -webkit-gradient(linear, top, bottom, color-stop(0%, #Ae0000), color-stop(50%, #ce0000), color-stop(51%, #ce0000), color-stop(0%, #Ae0000));
    background-image: -webkit-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -moz-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -o-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -ms-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    -webkit-box-shadow: #d7e9f6 0 1px 0px 0 inset, #d7e9f6 0 -1px 0px 0 inset, #d7e9f6 -1px 0 0px 0 inset, #d7e9f6 1px 0 0px 0 inset;
    -moz-box-shadow: #d7e9f6 0 1px 0px 0 inset, #d7e9f6 0 -1px 0px 0 inset, #d7e9f6 -1px 0 0px 0 inset, #d7e9f6 1px 0 0px 0 inset;
    box-shadow: #d7e9f6 0 1px 0px 0 inset, #d7e9f6 0 -1px 0px 0 inset, #d7e9f6 -1px 0 0px 0 inset, #d7e9f6 1px 0 0px 0 inset;
}

.x-btn-danger-small.x-arrow-focus .x-btn-arrow-el {
    border: 1px solid #d7e9f6;
}

.x-btn-over.x-btn-danger-small {
    border-color: #cc0303;
    background-image: none;
    background-color: #ee0000;
    background-image: -webkit-gradient(linear, top, bottom, color-stop(0%, #ce0000), color-stop(50%, #ee0000), color-stop(51%, #ee0000), color-stop(0%, #ce0000));
    background-image: -webkit-linear-gradient(top, #ce0000, #ee0000 50%, #ee0000 51%, #ce0000);
    background-image: -moz-linear-gradient(top, #ce0000, #ee0000 50%, #ee0000 51%, #ce0000);
    background-image: -o-linear-gradient(top, #ce0000, #ee0000 50%, #ee0000 51%, #ce0000);
    background-image: -ms-linear-gradient(top, #ce0000, #ee0000 50%, #ee0000 51%, #ce0000);
    background-image: linear-gradient(top, #ce0000, #ee0000 50%, #ee0000 51%, #ce0000);
}

.x-btn-focus.x-btn-over.x-btn-danger-small {
    -webkit-box-shadow: #d6e7f3 0 1px 0px 0 inset, #d6e7f3 0 -1px 0px 0 inset, #d6e7f3 -1px 0 0px 0 inset, #d6e7f3 1px 0 0px 0 inset;
    -moz-box-shadow: #d6e7f3 0 1px 0px 0 inset, #d6e7f3 0 -1px 0px 0 inset, #d6e7f3 -1px 0 0px 0 inset, #d6e7f3 1px 0 0px 0 inset;
    box-shadow: #d6e7f3 0 1px 0px 0 inset, #d6e7f3 0 -1px 0px 0 inset, #d6e7f3 -1px 0 0px 0 inset, #d6e7f3 1px 0 0px 0 inset;
}

.x-btn.x-btn-menu-active.x-btn-danger-small,
.x-btn.x-btn-pressed.x-btn-danger-small {
    border-color: #cc0303;
    background-image: none;
    background-color: #Ae0000;
    background-image: -webkit-gradient(linear, top, bottom, color-stop(0%, #2e0000), color-stop(50%, #Ae0000), color-stop(51%, #Ae0000), color-stop(0%, #2e0000));
    background-image: -webkit-linear-gradient(top, #2e0000, #Ae0000 50%, #Ae0000 51%, #2e0000);
    background-image: -moz-linear-gradient(top, #2e0000, #Ae0000 50%, #Ae0000 51%, #2e0000);
    background-image: -o-linear-gradient(top, #2e0000, #Ae0000 50%, #Ae0000 51%, #2e0000);
    background-image: -ms-linear-gradient(top, #2e0000, #Ae0000 50%, #Ae0000 51%, #2e0000);
    background-image: linear-gradient(top, #2e0000, #Ae0000 50%, #Ae0000 51%, #2e0000);
}

.x-btn-focus.x-btn-menu-active.x-btn-danger-small,
.x-btn-focus.x-btn-pressed.x-btn-danger-small {
    -webkit-box-shadow: #d4e2ec 0 1px 0px 0 inset, #d4e2ec 0 -1px 0px 0 inset, #d4e2ec -1px 0 0px 0 inset, #d4e2ec 1px 0 0px 0 inset;
    -moz-box-shadow: #d4e2ec 0 1px 0px 0 inset, #d4e2ec 0 -1px 0px 0 inset, #d4e2ec -1px 0 0px 0 inset, #d4e2ec 1px 0 0px 0 inset;
    box-shadow: #d4e2ec 0 1px 0px 0 inset, #d4e2ec 0 -1px 0px 0 inset, #d4e2ec -1px 0 0px 0 inset, #d4e2ec 1px 0 0px 0 inset;
}

.x-btn.x-btn-disabled.x-btn-danger-small {
    border-color: #cc0303;
    background-image: none;
    background-color: #ce0000;
    background-image: -webkit-gradient(linear, top, bottom, color-stop(0%, #Ae0000), color-stop(50%, #ce0000), color-stop(51%, #ce0000), color-stop(0%, #Ae0000));
    background-image: -webkit-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -moz-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -o-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: -ms-linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
    background-image: linear-gradient(top, #Ae0000, #ce0000 50%, #ce0000 51%, #Ae0000);
}

.x-btn-focus .x-btn-danger-small-mc {
    background-color: #ce0000;
    background-image: url(images/btn/btn-danger-small-focus-fbg.gif);
}

.x-btn-over .x-btn-danger-small-mc {
    background-color: #ee0000;
    background-image: url(images/btn/btn-danger-small-over-fbg.gif);
}

.x-btn-focus.x-btn-over .x-btn-danger-small-mc {
    background-color: #ce0000;
    background-image: url(images/btn/btn-danger-small-focus-over-fbg.gif);
}

.x-btn.x-btn-menu-active .x-btn-danger-small-mc,
.x-btn.x-btn-pressed .x-btn-danger-small-mc {
    background-color: #Ae0000;
    background-image: url(images/btn/btn-danger-small-pressed-fbg.gif);
}

.x-btn-focus.x-btn-menu-active .x-btn-danger-small-mc,
.x-btn-focus.x-btn-pressed .x-btn-danger-small-mc {
    background-color: #Aa0000;
    background-image: url(images/btn/btn-danger-small-focus-pressed-fbg.gif);
}

.x-btn.x-btn-disabled .x-btn-danger-small-mc {
    background-color: #ce0000;
    background-image: url(images/btn/btn-danger-small-disabled-fbg.gif);
}
.x-btn-disabled.x-btn-danger-small {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
    opacity: 0.5;
}

.x-nbr .x-segmented-button-item.x-btn-focus.x-btn-danger-small:after {
    border-width: 1px;
    border-color: #cc0303;
}

.x-nbr .x-segmented-button-item.x-btn-focus.x-btn-over.x-btn-danger-small:after {
    border-width: 1px;
    border-color: #dd0303;
}

.x-nbr .x-segmented-button-item.x-btn-focus.x-btn-menu-active.x-btn-danger-small:after,
.x-nbr .x-segmented-button-item.x-btn-focus.x-btn-pressed.x-btn-danger-small:after {
    border-width: 1px;
    border-color: #dd0303;
}

