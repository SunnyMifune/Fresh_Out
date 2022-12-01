// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FlashController from "./flash_controller"
application.register("flash", FlashController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ScanPageController from "./scan_page_controller"
application.register("scan-page", ScanPageController)

import SearchFoodsController from "./search_foods_controller"
application.register("search-foods", SearchFoodsController)

import SubmitAllScannedController from "./submit_all_scanned_controller"
application.register("submit-all-scanned", SubmitAllScannedController)

import ToastController from "./toast_controller"
application.register("toast", ToastController)

import TomSelectController from "./tom_select_controller"
application.register("tom-select", TomSelectController)

import TriggerScanSubmitController from "./trigger_scan_submit_controller"
application.register("trigger-scan-submit", TriggerScanSubmitController)
