const { environment } = require('@rails/webpacker')
module.exports = environment
const webpack = require('webpack')
const { resolve } = require('path')

environment.loaders.append('sass', {
  test: /\.scss$/,
  use: [
    { loader: 'style-loader' },
    { loader: 'css-loader' },
    {
      loader: 'sass-loader',
      options: {
        implementation: require('sass'),
        sassOptions: {
          includePaths: [resolve(__dirname, 'node_modules')]
        }
      }
    }
  ]
})

environment.plugins.append('Provide', 
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
