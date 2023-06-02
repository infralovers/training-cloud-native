// Configure the OTLP metric exporter
const exporterOptions = {
  url: "http://my-release-signoz-otel-collector.platform.svc.cluster.local:4318/v1/metrics",
};
const opentelemetry = require('@opentelemetry/api')
const {
    MeterProvider,
    PeriodicExportingMetricReader,
    ConsoleMetricExporter
  } = require('@opentelemetry/sdk-metrics');
const { Resource } = require('@opentelemetry/resources');
const { SemanticResourceAttributes } = require('@opentelemetry/semantic-conventions');

const metricExporter = new OTLPMetricExporter({});

const meterProvider = new MeterProvider({
  resource: new Resource({
    [SemanticResourceAttributes.SERVICE_NAME]: 'basic-metric-service',
  }),
});

meterProvider.addMetricReader(new PeriodicExportingMetricReader({
  exporter: metricExporter,
  exportIntervalMillis: 1000,
}));

const myServiceMeterProvider = new MeterProvider({
  resource: resource,
});

myServiceMeterProvider.addMetricReader(metricReader);

// Set this MeterProvider to be global to the app being instrumented.
opentelemetry.metrics.setGlobalMeterProvider(myServiceMeterProvider)