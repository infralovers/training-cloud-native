'use strict';

const { BasicTracerProvider, ConsoleSpanExporter, SimpleSpanProcessor } = require('@opentelemetry/sdk-trace-base');
const { Resource } = require('@opentelemetry/resources');
const { SemanticResourceAttributes } = require('@opentelemetry/semantic-conventions');
const {
  diag,
  trace,
  context,
  DiagConsoleLogger,
  DiagLogLevel,
} = require('@opentelemetry/api');
const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-http');
// const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-grpc');
// const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-proto');

diag.setLogger(new DiagConsoleLogger(), DiagLogLevel.DEBUG);

const exporter = new OTLPTraceExporter({});

const provider = new BasicTracerProvider({
  resource: new Resource({
    [SemanticResourceAttributes.SERVICE_NAME]: 'basic-service',
  }),
});
provider.addSpanProcessor(new SimpleSpanProcessor(exporter));
provider.addSpanProcessor(new SimpleSpanProcessor(new ConsoleSpanExporter()));
provider.register();
