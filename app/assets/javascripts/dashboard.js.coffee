# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#user_menu").optionsPopover
    id: "menu2"
    title: "What's Up?"
    contents: [
      {
        name: "Another Menu Item 1"
        url: "am1"
      }
      {
        name: "Another Menu Item 2"
        url: "am2"
      }
      {
        name: "Link to first button's menu..."
        id: "menu1"
      }
    ]
