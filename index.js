const unleash = require('unleash-server');

unleash
  .start({
    databaseUrl: 'postgres://demo:secretpassword@localhost:32770/postgres',
    port: 4242,
  })
  .then(unleash => {
    console.log(
      `Unleash started on http://localhost:${unleash.app.get('port')}`,
    );
  });