CallBack = () ->
    this.isRunning = false
    # status is one of pending processing done
    this.status = 'pending'
    this._cbQueue = new Queue()

CallBack.prototype =
    constructor: CallBack
    then: (cb) ->
        if this.status === 'done'
            this._cbQueue.add(cb)
            this.process(arguments)
        else
            this._cbQueue.add(cb)

    process: () ->
        this.status = 'processing'
        cb = this._cbQueue.get()
        cb(arguments)

