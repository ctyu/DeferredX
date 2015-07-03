corePush = Array.prototype.push
coreSplice = Array.prototype.splice
coreToString = Object.prototype.toString
coreForEach = Array.prototype.forEach || (fn) ->
    for item, i in this
        fn(item,i)

isArray = (value) -> 
    return coreToString.call(value).toLowerCase() === 'array' if value?

Queue = () -> 
    this._queue = []
    this._lock = false

Queue.prototype = 
    'constructor':  Queue
    'get': ->
        this._queue.shift() if !this._lock
    'add': (items) ->
        if !isArray(items)
            items = [items]
        corePush.apply(this._queue,items)
    'lock': -> 
        this._lock = true
    'unLock': ->
        this._lock = false
    'insertAfter': (index,items) ->
        me = this
        index = 0 if index < 0
        if !isArray(items)
            items = [items]
        coreForEach.call(items,(value, _index) -> 
            me.splice(index + _index, 0, value)
        )
    'size' : () ->
        this._queue.length