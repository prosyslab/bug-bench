def check_single_point(item):
    return ('file' in item) \
        and (item['file']) \
        and (item['line'] and type(item['line']) == int)


def check_two_point(item):
    return ('source' in item \
        and item['source'])  \
        and (item['source']['file']) \
        and (item['source']['line'] and type(item['source']['line']) == int) \
        and ('sink' in item \
        and item['sink']) \
        and (item['sink']['file']) \
        and (item['sink']['line'] and type(item['sink']['line']) == int)