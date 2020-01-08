# Example of `Feature Flags` with [Unleash](https://github.com/Unleash/unleash) library.

### Getting started

1. Install dependencies `yarn install`
2. Run docker services `docker-compose up -d`
3. Import dumped data `./import`
4. Run server `yarn start`

### Usage

**Unleash** provides admin panel by the address http://localhost:4242, where you can define different toggles and strategies.
In this example we have two toggles already saved: `featureX` and `featureY`, all enabled.

`yarn client` launches example of the client, which is checking both feature flags.
`featureX` is a simple feature, that can be turned on or off.
`featureY` depends on context, it will be `true` for staging environment, and `false` for production.
