package logger

import (
	"fmt"
	"log/slog"
	"os"

	"github.com/pressly/goose/v3"
)

var _ goose.Logger = (*slogLogger)(nil)

type slogLogger struct {
	logger *slog.Logger
}

func (l *slogLogger) Printf(format string, v ...interface{}) {
	l.logger.Info(fmt.Sprintf(format, v...))
}

func (l *slogLogger) Fatalf(format string, v ...interface{}) {
	l.logger.Error(fmt.Sprintf(format, v...))
}

func NewSlogDefaultLogger() goose.Logger {
	return &slogLogger{logger: slog.Default()}
}

func NewSlogJsonLogger() goose.Logger {
	showLevel := &slog.LevelVar{}
	showLevel.Set(slog.LevelDebug)
	h := slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{Level: showLevel})
	return &slogLogger{logger: slog.New(h)}
}
