# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  colors = [
    '#AFB1E4'
    '#757CA3'
    '#DFBAC1'
    '#B6A5BE'
    '#D7CCDF'
    '#32394F'
  ]
  userIndex = {}
  i = 0
  while i < users.length
    userIndex[users[i].id] = i
    i++
  i = 0
  while i < events.length
    events[i].end = events[i].end_time
    events[i].start = events[i].start_time
    events[i].color = colors[userIndex[events[i].user_id]]
    if events[i].private and curUserId != events[i].user_id
      events[i].title = "Private Event"
    i++
  $('#g_calendar').fullCalendar
    events: events,
    eventClick: (event, jsEvent, view) ->
      console.log "something"
      #set the values and open the modal
      debugger
      $('#eventInfo').html event.description
      $('#eventLink').attr 'href', event.url
      $('#eventContent').dialog
        modal: true
        title: event.title
      return
    header:
      left: 'agendaWeek,agendaDay',
      right: 'prev,today,next',
    titleFormat: 'MMMM yyyy',
    defaultView: 'agendaWeek',
    height: 450,
    slotMinutes: 30,
    displayEventTime: false,
    # events: window.location.pathname,
    allDayDefault: false,
    firstHour: (new Date).getHours(),
    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5",
    slotEventOverlap: false,
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