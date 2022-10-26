var mugStore = stores.open('MUG_STORE')
var mugs = JSON.parse(mugStore.load('MUGS')) || []

if (context.request.method == 'GET') {
    respond().withStatusCode(200).withContent(JSON.stringify(mugs))
    return
}

if (context.request.method == 'POST') {
    var mugData = JSON.parse(context.request.body)
    mugs.push(mugData)
    mugStore.save('MUGS', JSON.stringify(mugs))
    respond().withStatusCode(200).withContent(JSON.stringify(mugData))
    return
}

if (context.request.method == 'PUT') {
    var mugData = JSON.parse(context.request.body)
    mugs = mugs.map(function (mug) { return mug.id === mugData.id ? mugData : mug })
    mugStore.save('MUGS', JSON.stringify(mugs))
    respond().withStatusCode(200).withContent(JSON.stringify(mugData))
    return
}

if (context.request.method == 'DELETE') {
    var deletedId = context.request.pathParams.mugId
    mugs = mugs.filter(function (mug) { return mug.id != deletedId })
    mugStore.save('MUGS', JSON.stringify(mugs))
    respond().withStatusCode(204)
    return
}