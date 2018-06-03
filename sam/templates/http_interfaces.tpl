package {package}

import (
	"net/http"
)

// HTTP handlers are a superset of internal APIs
type {name}Handlers struct {
	*{name}
}

func ({name}Handlers) new() *{name}Handlers {
	return &{name}Handlers{
		{name}{}.new(),
	}
}

// Internal API interface
type {name}API interface {
{foreach $calls as $call}
	{call.name|ucfirst}(*{name}{call.name|ucfirst}Request) (interface{}, error)
{/foreach}
}

// HTTP API interface
type {name}HandlersAPI interface {
{foreach $calls as $call}
	{call.name|ucfirst}(http.ResponseWriter, *http.Request)
{/foreach}
}

// Compile time check to see if we implement the interfaces
var _ {name}HandlersAPI = &{name}Handlers{}
var _ {name}API = &{name}{}