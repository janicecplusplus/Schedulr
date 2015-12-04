# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  userIndex = {}
  i = 0
  while i < users.length
    userIndex[users[i].id] = i
    i++
  i = 0
  while i < events.length
    events[i].start = events[i].start_time
    events[i].end = events[i].end_time
    events[i].color = colors[userIndex[events[i].user_id]]
    events[i].borderColor = ""
    delete events[i].url
    if events[i].private
      events[i].title = "Private Event"
    i++
  $('#g_calendar').fullCalendar
    events: events,
    eventClick: (event, jsEvent, view) ->
      #set the values and open the modal
      $('#groupTitle').html event.title
      if !event.private
        $('#groupDescription').html "<b>Description: </b>" + event.description
      $('#groupStartTime').html "<b>Start Time: </b>" + event.start_time
      $('#groupEndTime').html "<b>End Time: </b>" + event.end_time
      $('#groupModal').modal()
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