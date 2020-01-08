const {initialize, isEnabled, Strategy} = require('unleash-client');

class EnvStrategy extends Strategy {
    constructor() {
        super('EnvStrategy');
    }

    isEnabled(parameters, context) {
        return parameters.env.split(',').map(value => value.trim()).includes(context.env);
    }
}

const init = () => new Promise((resolve) => {
    const instance = initialize({
        url: 'http://localhost:4242/api/',
        appName: 'newapp',
        instanceId: 'my-unique-instance-id',
        strategies: [new EnvStrategy()]
    });
    instance.on('error', console.error);
    instance.on('warn', console.warn);
    instance.once('ready', resolve);
});

init().then(() => {
    console.log('feature X enabled: ', isEnabled('featureX'));
    console.log('feature Y staging enabled: ', isEnabled('featureY', {env: 'staging'}));
    console.log('feature Y production enabled: ', isEnabled('featureY', {env: 'production'}));
});

