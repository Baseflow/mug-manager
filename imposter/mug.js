var mugStore = stores.open('MUG_STORE')
var mugs = JSON.parse(mugStore.load('MUGS')) || []

if (context.request.method == 'GET') {
    respond().withStatusCode(200).withContent(JSON.stringify(mugs))
    return
}

if (context.request.method == 'POST') {
    var mugData = JSON.parse(context.request.body)
    var nextMugId = mugStore.load('NEXT_MUG_ID') || 1
    mugData.id = nextMugId
    mugStore.save('NEXT_MUG_ID', ++nextMugId)
    mugs.push(mugData)
    mugStore.save('MUGS', JSON.stringify(mugs))
    respond().withStatusCode(200).withContent(JSON.stringify(mugData))
    return
}

if (context.request.method == 'PUT') {
    var updatedId = +context.request.pathParams.mugId
    var mugData = JSON.parse(context.request.body)
    mugData.id = updatedId
    mugs = mugs.map(function (mug) { return mug.id === mugData.id ? mugData : mug })
    mugStore.save('MUGS', JSON.stringify(mugs))
    respond().withStatusCode(200).withContent(JSON.stringify(mugData))
    return
}

if (context.request.method == 'DELETE') {
    var deletedId = +context.request.pathParams.mugId
    mugs = mugs.filter(function (mug) { return mug.id !== deletedId })
    mugStore.save('MUGS', JSON.stringify(mugs))
    respond().withStatusCode(204)
    return
}