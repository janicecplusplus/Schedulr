# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  i = 0
  while i < events.length
    events[i].start = events[i].start_time
    events[i].end = events[i].end_time
    # events[i].url = 'events/' + events[i].id + '.html'
    if events[i].private
      events[i].borderColor = "black"
    i++
  $('#calendar').fullCalendar
    editable: true,
    header:
      left: 'agendaWeek,agendaDay',
      right: 'prev,today,next',
    eventClick: (event, jsEvent, view) ->
      #set the values and open the modal
      $('#eventTitle').html event.title
      $('#eventDescription').html "<b>Description: </b>" + event.description
      $('#eventStartTime').html "<b>Start Time: </b>" + event.start_time
      $('#eventEndTime').html "<b>End Time: </b>" + event.end_time
      if event.private
        $('#eventPrivacy').html "<b>Private: </b>yes"
      else
        $('#eventPrivacy').html "<b>Private: </b>no"
      $('#linkToEdit').attr('href','/events/' + event.id + '/edit')
      $('#eventModal').modal()
    titleFormat: 'MMMM yyyy',
    defaultView: 'agendaWeek',
    height: 450,
    slotMinutes: 30,
    events: events,
    allDayDefault: false,
    firstHour: (new Date).getHours(),
    timeFormat: 'h:mm t{ - h:mm t} ',
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