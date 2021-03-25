import com.xebialabs.deployit.plugin.stitch.service.engine.processor.handler.groovy.MapFunction
def stitch(spec, params, document, ctx) {
    def supportedTags = params['entries']
    def path = params['path']
    document.map(path, new MapFunction() {
        Object map(currentValue) {
            supportedTags.each { key, val ->
                currentValue.put(key, val)
            }
            currentValue
        }
    })
    document.getMutatedDocument()
}
