# This is only an example Thrift interface.
# You should rewrite this file ;)
#
# This file will be pushed to rt/idl-registry everytime you
# land to master.

namespace java com.uber.3p.moneyloop

exception NotFoundError {
    1: required string key,
}

service KeyValue {

    string getValue(
        1: required string key,
    ) throws (
        1: NotFoundError notFound,
    )

    void setValue(
        1: required string key,
        2: required string value,
    )
}
