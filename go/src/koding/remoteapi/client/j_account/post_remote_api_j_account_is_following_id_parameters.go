package j_account

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

// NewPostRemoteAPIJAccountIsFollowingIDParams creates a new PostRemoteAPIJAccountIsFollowingIDParams object
// with the default values initialized.
func NewPostRemoteAPIJAccountIsFollowingIDParams() *PostRemoteAPIJAccountIsFollowingIDParams {
	var ()
	return &PostRemoteAPIJAccountIsFollowingIDParams{

		timeout: cr.DefaultTimeout,
	}
}

// NewPostRemoteAPIJAccountIsFollowingIDParamsWithTimeout creates a new PostRemoteAPIJAccountIsFollowingIDParams object
// with the default values initialized, and the ability to set a timeout on a request
func NewPostRemoteAPIJAccountIsFollowingIDParamsWithTimeout(timeout time.Duration) *PostRemoteAPIJAccountIsFollowingIDParams {
	var ()
	return &PostRemoteAPIJAccountIsFollowingIDParams{

		timeout: timeout,
	}
}

// NewPostRemoteAPIJAccountIsFollowingIDParamsWithContext creates a new PostRemoteAPIJAccountIsFollowingIDParams object
// with the default values initialized, and the ability to set a context for a request
func NewPostRemoteAPIJAccountIsFollowingIDParamsWithContext(ctx context.Context) *PostRemoteAPIJAccountIsFollowingIDParams {
	var ()
	return &PostRemoteAPIJAccountIsFollowingIDParams{

		Context: ctx,
	}
}

/*PostRemoteAPIJAccountIsFollowingIDParams contains all the parameters to send to the API endpoint
for the post remote API j account is following ID operation typically these are written to a http.Request
*/
type PostRemoteAPIJAccountIsFollowingIDParams struct {

	/*Body
	  body of the request

	*/
	Body models.DefaultSelector
	/*ID
	  Mongo ID of target instance

	*/
	ID string

	timeout    time.Duration
	Context    context.Context
	HTTPClient *http.Client
}

// WithTimeout adds the timeout to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) WithTimeout(timeout time.Duration) *PostRemoteAPIJAccountIsFollowingIDParams {
	o.SetTimeout(timeout)
	return o
}

// SetTimeout adds the timeout to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) SetTimeout(timeout time.Duration) {
	o.timeout = timeout
}

// WithContext adds the context to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) WithContext(ctx context.Context) *PostRemoteAPIJAccountIsFollowingIDParams {
	o.SetContext(ctx)
	return o
}

// SetContext adds the context to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) SetContext(ctx context.Context) {
	o.Context = ctx
}

// WithBody adds the body to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) WithBody(body models.DefaultSelector) *PostRemoteAPIJAccountIsFollowingIDParams {
	o.SetBody(body)
	return o
}

// SetBody adds the body to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) SetBody(body models.DefaultSelector) {
	o.Body = body
}

// WithID adds the id to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) WithID(id string) *PostRemoteAPIJAccountIsFollowingIDParams {
	o.SetID(id)
	return o
}

// SetID adds the id to the post remote API j account is following ID params
func (o *PostRemoteAPIJAccountIsFollowingIDParams) SetID(id string) {
	o.ID = id
}

// WriteToRequest writes these params to a swagger request
func (o *PostRemoteAPIJAccountIsFollowingIDParams) WriteToRequest(r runtime.ClientRequest, reg strfmt.Registry) error {

	r.SetTimeout(o.timeout)
	var res []error

	if err := r.SetBodyParam(o.Body); err != nil {
		return err
	}

	// path param id
	if err := r.SetPathParam("id", o.ID); err != nil {
		return err
	}

	if len(res) > 0 {
		return errors.CompositeValidationError(res...)
	}
	return nil
}
