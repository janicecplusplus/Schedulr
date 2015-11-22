# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#calendar').fullCalendar
    editable: true,
    header:
      left: 'agendaWeek,agendaDay',
      right: 'prev,today,next',
    titleFormat: 'MMMM yyyy',
    defaultView: 'agendaWeek',
    height: 450,
    slotMinutes: 30,
    events: '/events.json',
    allDayDefault: false,
    firstHour: (new Date).getHours(),
    timeFormat: 'h:mm t{ - h:mm t} ',
    editable: true,
    dragOpacity: "0.5",
    slotEventOverlap: false,
    eventColor: "#AFB1E4"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);


updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event:
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description

$(document).ready(ready)
$(document).on('page:load', ready)