CallBack = () ->
    this.isRunning = false
    # status is one of pending processing done
    this.status = 'pending'
    this._cbQueue = new Queue()

CallBack.prototype =
    constructor: CallBack
    add :(cbs) ->
        this._cbQueue.add(cbs)
