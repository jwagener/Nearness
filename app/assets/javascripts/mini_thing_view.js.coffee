NN.MiniThingView = Backbone.View.extend
  tagName: "div"
  events: {}
  #template: $("#thingTemplate")
  initialize: ->
    this

  render: ->
    templateHtml = $("#miniThingTemplate").html()
    html = Mustache.to_html(templateHtml, this.model.toJSON())
    this.$el.html(html)
    this