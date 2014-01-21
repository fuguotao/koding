class AccountReferralSystemListController extends AccountListViewController

  constructor: (options, data)->
    options.noItemFoundText = "You dont have any referal."
    super options, data

  loadItems: ->
    @removeAllItems()
    @showLazyLoader yes
    query = { type : "disk" }
    options = {limit : 20}
    KD.remote.api.JReferral.fetchReferredAccounts query, options, (err, referals)=>
      return KD.showError err if err
      @instantiateListItems referals or []
    @hideLazyLoader()

    @on "RedeemReferralPointSubmitted", @bound "redeemReferralPoint"
    @on "ShowRedeemReferralPointModal", @bound "showRedeemReferralPointModal"

  notify_:(message)->
    new KDNotificationView
      title    : message
      duration : 2500

  redeemReferralPoint:(modal)->
    {vmToResize, sizes} = modal.modal.modalTabs.forms.Redeem.inputs

    data = {
      vmName : vmToResize.getValue(),
      size   : sizes.getValue(),
      type   : "disk"
    }

    KD.remote.api.JReferral.redeem data, (err, refRes)=>
      return KD.showError err if err
      modal.modal.destroy()
      KD.getSingleton("vmController").resizeDisk data.vm, (err, res)=>
        return KD.showError err if err
        @notify_ """
          #{refRes.addedSize} #{refRes.unit} extra #{refRes.type} is successfully added to your #{refRes.vm} VM.
        """


  showRedeemReferralPointModal: KD.utils.showRedeemReferralPointModal

  loadView: ->
    super
    @addHeader()
    @loadItems()

  addHeader:->

    wrapper = new KDCustomHTMLView tagName : 'header', cssClass : 'clearfix'
    @getView().addSubView wrapper, '', yes

    wrapper.addSubView getYourReferrerCode = new CustomLinkView
      title       : "Get Your Referrer Code"
      tooltip     :
        title     :
          """
          If anyone registers with your referrer code,
          you will get 250MB Free disk space for your VM.
          Up to 16GB!.
          """
      click       : ->
        appManager = KD.getSingleton "appManager"
        appManager.tell "Account", "showReferrerModal",
          linkView    : getYourReferrerCode
          top         : 50
          left        : 35
          arrowMargin : 110


    wrapper.addSubView redeem = new CustomLinkView
      title : "Redeem Your Referrer Points"
      click : => @emit "ShowRedeemReferralPointModal", this

class AccountReferralSystemList extends KDListView

  constructor:(options,data)->
    options = $.extend
      tagName      : "ul"
      itemClass : AccountReferralSystemListItem
    ,options
    super options,data


class AccountReferralSystemListItem extends KDListItemView
  constructor: (options, data)->
    options =
      tagName: "li"
    super options, data

  viewAppended: ->
    @getData().isEmailVerified (err, status)=>
      unless (err or status)
        @addSubView editLink = new KDCustomHTMLView
           tagName      : "a"
           partial      : "Mail Verification Waiting"
           cssClass     : "action-link"

      super

  partial: (data)->
    """
    <a href="/#{data.profile.nickname}"> #{data.profile.firstName} #{data.profile.lastName} </a>
    """
