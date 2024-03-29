// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("packs/utilities/sorting.js")
require("packs/utilities/password_check.js")
require("packs/utilities/form_inline.js")
require("packs/utilities/progress_bar.js")
require("packs/utilities/timer.js")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
