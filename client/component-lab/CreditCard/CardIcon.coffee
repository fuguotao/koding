React = require 'react'
styles = require './CreditCard.stylus'
classnames = require 'classnames'

{ Brand } = require './constants'
Icon = require 'lab/Icon'

ICONS =
  'american-express':
    '1x': require 'app/sprites/1x/amex.png'
    '2x': require 'app/sprites/2x/amex.png'
  'american-express-light':
    '1x': require 'app/sprites/1x/amex-light.png'
    '2x': require 'app/sprites/2x/amex-light.png'
  'diners-club':
    '1x': require 'app/sprites/1x/dinersclub.png'
    '2x': require 'app/sprites/2x/dinersclub.png'
  discover:
    '1x': require 'app/sprites/1x/discover.png'
    '2x': require 'app/sprites/2x/discover.png'
  jcb:
    '1x': require 'app/sprites/1x/jcb.png'
    '2x': require 'app/sprites/2x/jcb.png'
  maestro:
    '1x': require 'app/sprites/1x/maestro.png'
    '2x': require 'app/sprites/2x/maestro.png'
  mastercard:
    '1x': require 'app/sprites/1x/mastercard.png'
    '2x': require 'app/sprites/2x/mastercard.png'
  visa:
    '1x': require 'app/sprites/1x/visa.png'
    '2x': require 'app/sprites/2x/visa.png'

ICONS['master-card'] = ICONS['mastercard']

ICON_HEIGHT =
  small: 9
  regular: 18
  big: 27

module.exports = CardIcon = ({ brand, size, style, light }) ->

  wrapperClassName = classnames [
    styles['brand-wrapper']
    styles[size]
  ]

  <div className={wrapperClassName} style={style}>
    <BrandImage brand={brand} size={size} light={light} />
  </div>


BrandImage = ({ brand, size, light }) ->

  if brand is Brand.DEFAULT
    return (
      <span className={classnames(size, styles['brand-default'])} />
    )

  icons = if light and ICONS["#{brand}-light"]
  then ICONS["#{brand}-light"]
  else ICONS[brand]

  height = ICON_HEIGHT[size]

  <Icon width='auto' height={height} 1x={icons['1x']} 2x={icons['2x']} />

CardIcon.defaultProps =
  light: no
  size: 'regular'
  brand: Brand.DEFAULT
