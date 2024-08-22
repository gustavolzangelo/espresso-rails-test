// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const { generateWebpackConfig, merge } = require("shakapacker");
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");

const webpackConfig = generateWebpackConfig();

module.exports = merge(webpackConfig, {
  resolve: {
    extensions: [".js", ".jsx", ".ts", ".tsx"],
  },
  module: {
    rules: [
      {
        test: /\.(ts|tsx)$/,
        use: {
          loader: "babel-loader",
          options: {
            presets: [
              "@babel/preset-env",
              "@babel/preset-react",
              "@babel/preset-typescript",
            ],
          },
        },
        exclude: /node_modules/,
      },
    ],
  },
  plugins: [new ForkTsCheckerWebpackPlugin()],
});
