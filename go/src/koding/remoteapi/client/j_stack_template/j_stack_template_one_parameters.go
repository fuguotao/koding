package j_stack_template

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the swagger generate command

import (
	"net/http"
	"time"

	"golang.org/x/net/context"

	"github.com/go-openapi/errors"
	"github.com/go-openapi/runtime"
	cr "github.com/go-openapi/runtime/client"

	strfmt "github.com/go-openapi/strfmt"

	"koding/remoteapi/models"
)

// NewJStackTemplateOneParams creates a new JStackTemplateOneParams object
// with the default values initialized.
func NewJStackTemplateOneParams() *JStackTemplateOneParams {
	var ()
	return &JStackTemplateOneParams{

		timeout: cr.DefaultTimeout,
	}
}

// NewJStackTemplateOneParamsWithTimeout creates a new JStackTemplateOneParams object
// with the default values initialized, and the ability to set a timeout on a request
func NewJStackTemplateOneParamsWithTimeout(timeout time.Duration) *JStackTemplateOneParams {
	var ()
	return &JStackTemplateOneParams{

		timeout: timeout,
	}
}

// NewJStackTemplateOneParamsWithContext creates a new JStackTemplateOneParams object
// with the default values initialized, and the ability to set a context for a request
func NewJStackTemplateOneParamsWithContext(ctx context.Context) *JStackTemplateOneParams {
	var ()
	return &JStackTemplateOneParams{

		Context: ctx,
	}
}

/*JStackTemplateOneParams contains all the parameters to send to the API endpoint
for the j stack template one operation typically these are written to a http.Request
*/
type JStackTemplateOneParams struct {

	/*Body
	  body of the request

	*/
	Body models.DefaultSelector

	timeout    time.Duration
	Context    context.Context
	HTTPClient *http.Client
}

// WithTimeout adds the timeout to the j stack template one params
func (o *JStackTemplateOneParams) WithTimeout(timeout time.Duration) *JStackTemplateOneParams {
	o.SetTimeout(timeout)
	return o
}

// SetTimeout adds the timeout to the j stack template one params
func (o *JStackTemplateOneParams) SetTimeout(timeout time.Duration) {
	o.timeout = timeout
}

// WithContext adds the context to the j stack template one params
func (o *JStackTemplateOneParams) WithContext(ctx context.Context) *JStackTemplateOneParams {
	o.SetContext(ctx)
	return o
}

// SetContext adds the context to the j stack template one params
func (o *JStackTemplateOneParams) SetContext(ctx context.Context) {
	o.Context = ctx
}

// WithBody adds the body to the j stack template one params
func (o *JStackTemplateOneParams) WithBody(body models.DefaultSelector) *JStackTemplateOneParams {
	o.SetBody(body)
	return o
}

// SetBody adds the body to the j stack template one params
func (o *JStackTemplateOneParams) SetBody(body models.DefaultSelector) {
	o.Body = body
}

// WriteToRequest writes these params to a swagger request
func (o *JStackTemplateOneParams) WriteToRequest(r runtime.ClientRequest, reg strfmt.Registry) error {

	r.SetTimeout(o.timeout)
	var res []error

	if err := r.SetBodyParam(o.Body); err != nil {
		return err
	}

	if len(res) > 0 {
		return errors.CompositeValidationError(res...)
	}
	return nil
}
