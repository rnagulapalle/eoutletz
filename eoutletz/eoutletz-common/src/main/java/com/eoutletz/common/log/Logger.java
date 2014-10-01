package com.eoutletz.common.log;

import org.apache.log4j.Priority;

/**
 * Custom logger for BFA.
 * 
 * @author
 */
public final class Logger {
    private org.apache.log4j.Logger LOGGER;

    @SuppressWarnings("rawtypes")
    public Logger(Class clazz) {
        this.LOGGER = org.apache.log4j.Logger.getLogger(clazz);
    }

    public static <T> Logger getLogger(Class<T> clazz) {
        return new Logger(clazz);
    }

    public void log(Priority priority, Object message) {
        LOGGER.log(priority, message);
    }

    public void log(Priority priority, Object message, Throwable t) {
        LOGGER.log(priority, message, t);
    }

    public void log(String callerFQCN, Priority level, Object message, Throwable t) {
        LOGGER.log(callerFQCN, level, message, t);
    }

    public void info(Object message) {
        if (LOGGER.isInfoEnabled()) {
            LOGGER.info(message);
        }
    }

    public void info(Object message, Throwable t) {
        if (LOGGER.isInfoEnabled()) {
            LOGGER.info(message, t);
        }
    }

    public void debug(Object message) {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug(message);
        }
    }

    public void debug(Object message, Throwable t) {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug(message, t);
        }
    }

    public void trace(Object message) {
        if (LOGGER.isTraceEnabled()) {
            LOGGER.trace(message);
        }
    }

    public void trace(Object message, Throwable t) {
        if (LOGGER.isTraceEnabled()) {
            LOGGER.trace(message, t);
        }
    }

    public void warn(Object message) {
        LOGGER.warn(message);
    }

    public void warn(Object message, Throwable t) {
        LOGGER.warn(message, t);
    }

    public void error(Object message) {
        LOGGER.error(message);
    }

    public void error(Object message, Throwable t) {
        LOGGER.error(message, t);
    }

    public void fatal(Object message) {
        LOGGER.fatal(message);
    }

    public void fatal(Object message, Throwable t) {
        LOGGER.fatal(message, t);
    }

}
