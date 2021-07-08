// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


import "./src/application.scss"
import "bootstrap/dist/js/bootstrap"
import "bootstrap/dist/css/bootstrap"

require('jquery')
require('packs/railway_stations')
require('packs/routes')
require('packs/trains')
require('packs/carriages')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
