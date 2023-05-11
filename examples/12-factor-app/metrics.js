'use strict';

const { DiagConsoleLogger, DiagLogLevel, diag } = require('@opentelemetry/api');
const { OTLPMetricExporter } = require('@opentelemetry/exporter-metrics-otlp-http');
// const { OTLPMetricExporter } = require('@opentelemetry/exporter-metrics-otlp-grpc');
// const { OTLPMetricExporter } = require('@opentelemetry/exporter-metrics-otlp-proto');
const { MeterProvider, PeriodicExportingMetricReader } = require('@opentelemetry/sdk-metrics');
const { Resource } = require('@opentelemetry/resources');
const { SemanticResourceAttributes } = require('@opentelemetry/semantic-conventions');

// Optional and only needed to see the internal diagnostic logging (during development)
diag.setLogger(new DiagConsoleLogger(), DiagLogLevel.DEBUG);

const metricExporter = new OTLPMetricExporter({});

const meterProvider = new MeterProvider({
  resource: new Resource({
    [SemanticResourceAttributes.SERVICE_NAME]: 'api.service.js',
  }),
  resource: new Resource({
    [SemanticResourceAttributes.SERVICE_NAME]: 'products.service.js',
  }),
});

meterProvider.addMetricReader(new PeriodicExportingMetricReader({
  exporter: metricExporter,
  exportIntervalMillis: 1000,
}));
