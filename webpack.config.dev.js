const webpack = require('webpack');
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    // context: path.join(__dirname, "dev"),
    entry: {
        main: path.resolve(__dirname, './dev/main.js'),
        vendor: ['react', 'react-dom']
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: 'bundle.js',
    },
    devServer: {
        contentBase: path.resolve(__dirname, 'dist'),
        inline: true,
        port: 8005
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
            }
        ]
    },
    devtool: 'inline-source-map',
    mode: "development",
    plugins:[
        new webpack.HotModuleReplacementPlugin(),
        new HtmlWebpackPlugin({
            template: './dev/index.html'
        }),
        new webpack.ProvidePlugin({
            'React': 'react'
        })
    ]
}