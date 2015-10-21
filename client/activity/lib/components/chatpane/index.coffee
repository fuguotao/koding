kd                   = require 'kd'
React                = require 'kd-react'
ChatList             = require 'activity/components/chatlist'
ActivityFlux         = require 'activity/flux'
Scroller             = require 'app/components/scroller'
ScrollerMixin        = require 'app/components/scroller/scrollermixin'
ChannelInfoContainer = require 'activity/components/channelinfocontainer'


module.exports = class ChatPane extends React.Component

  @defaultProps =
    title          : null
    messages       : null
    isDataLoading  : no
    onInviteOthers : kd.noop
    showItemMenu   : yes


  componentWillUpdate: (nextProps, nextState) ->

    return  unless nextProps?.thread

    { thread } = nextProps

    isMessageBeingSubmitted = thread.getIn ['flags', 'isMessageBeingSubmitted']

    @shouldScrollToBottom = yes  if isMessageBeingSubmitted

    scrollContainer = React.findDOMNode @refs.scrollContainer
    scrollContainer?.classList.remove 'padded'


  onTopThresholdReached: (event) ->

    messages = @props.thread.get 'messages'

    return  if @isThresholdReached

    return  unless messages.size

    @isThresholdReached = yes

    kd.utils.wait 500, => @props.onLoadMore()


  channel: (key) -> @props.thread.getIn ['channel', key]


  renderChannelInfoContainer: ->

    return null  unless @props.thread

    messagesSize        = @props.thread.get('messages').size
    scrollContainer     = React.findDOMNode @refs.scrollContainer
    reachedFirstMessage = @props.thread.getIn(['flags', 'reachedFirstMessage'])

    return null  unless scrollContainer or reachedFirstMessage

    @setPaddedClassName yes  unless messagesSize

    <ChannelInfoContainer
      ref='ChannelInfoContainer'
      key={@channel 'id'}
      thread={@props.thread}
      onInviteOthers={@props.onInviteOthers} />


  beforeScrollToBottom: ->

    @resetPaddedClassName()
    @setPaddedClassName()


  afterScrollDidUpdate: ->

    @setPaddedClassName()


  setPaddedClassName: (shouldPaddedClass = no) ->

    list                        = React.findDOMNode @refs.ChatList
    scrollContainer             = React.findDOMNode @refs.scrollContainer
    channelInfoContainer        = React.findDOMNode @refs.ChannelInfoContainer
    listHeight                  = list.offsetHeight
    scrollContainerClientHeight = scrollContainer.clientHeight
    channelInfoContainerHeight  = 0

    return scrollContainer.classList.add 'padded' if shouldPaddedClass and scrollContainer

    return  if scrollContainerClientHeight is 0 or listHeight is 0

    if channelInfoContainer
      channelInfoContainerHeight = channelInfoContainer.offsetHeight

    diff      = scrollContainerClientHeight - (channelInfoContainerHeight + listHeight)
    hasPadded = scrollContainer.className.indexOf('padded') > -1

    if diff >= 0
    then scrollContainer.classList.add 'padded'
    else scrollContainer.classList.remove 'padded'


  renderBody: ->

    return null  unless @props.thread

    <Scroller
      ref="scrollContainer"
      onTopThresholdReached={@bound 'onTopThresholdReached'}>
      {@renderChannelInfoContainer()}
      <ChatList
        ref='ChatList'
        isMessagesLoading={@isThresholdReached}
        messages={@props.thread.get 'messages'}
        showItemMenu={@props.showItemMenu}
        channelId={@channel 'id'}
        channelName={@channel 'name'}
        unreadCount={@channel 'unreadCount'}
      />
    </Scroller>


  render: ->
    <div className={kd.utils.curry 'ChatPane', @props.className}>
      <section className="ChatPane-contentWrapper">
        <section className="ChatPane-body" ref="ChatPaneBody">
          {@renderBody()}
          {@props.children}
        </section>
      </section>
    </div>


React.Component.include.call ChatPane, [ScrollerMixin]

