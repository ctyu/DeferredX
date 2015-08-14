Queue = require('./Queue.coffee')

resolve = (resolve) ->
    resolve()

reject = (resolve, reject) ->
    reject()

statusWeight = 
    Pending : false
    Fulfilled : true
    Rejected : true

# status : Pending Fulfilled Rejected
# value : resolve value
# reason : reject reason
Promise = (cb) ->
    status = 'Pending'
    value = null
    reason = null
    fulFilledQueue = new Queue()
    rejectedQueue = new Queue()
    nextPromise = null

    changeStatus = (chStatus) ->
        if(!statusWeight[status])
            if chStatus isnt 'Pending'
                status = chStatus
                return true
        return false

    next = (isResolve, valueOrReason) ->
        forStatus = isResolve ? 'Fulfilled' : 'Rejected'
        value = valueOrReason if changeStatus 'Fulfilled'

    return {
        then : (onFulfilled, onRejected) ->
            onFulfilled = null if typeof onFulfilled isnt 'function'
            onRejected = null if typeof onRejected isnt 'function'
            onFulfilled && fulFilledQueue.push(onFulfilled)
            onRejected && rejectedQueue.push(onRejected)
            return new Promise()

        getStatus : ()->
            status
    }
