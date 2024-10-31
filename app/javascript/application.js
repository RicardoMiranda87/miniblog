import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/css/all.css"
import "stylesheets/application"
import "controllers"
import * as bootstrap from "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
