package com.eoutletz.common.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import com.eoutletz.common.log.Logger;


@SuppressWarnings("rawtypes")
public class ReflectionUtil {

    private static Logger logger = Logger.getLogger(ReflectionUtil.class);

    /**
     * Get the class generic type by java reflect, which the generic type
     * defined in the super class.
     * 
     * @param clazz
     */
    @SuppressWarnings("unchecked")
    public static <T> Class<T> getClassGenericType(final Class clazz) {
        return getClassGenericType(clazz, 0);
    }

    /**
     * Get the class generic type by java reflect, which the generic type
     * defined in the super class. If not found, return the Object.class.
     * 
     * @param clazz
     * @param index
     */
    public static Class getClassGenericType(final Class clazz, final int index) {

        Type genType = clazz.getGenericSuperclass();

        if (!(genType instanceof ParameterizedType)) {
            logger.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");
            return Object.class;
        }

        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

        if (index >= params.length || index < 0) {
            logger.warn("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: "
                    + params.length);
            return Object.class;
        }
        if (!(params[index] instanceof Class)) {
            logger.warn(clazz.getSimpleName() + " not set the actual class on superclass generic parameter");
            return Object.class;
        }

        return (Class) params[index];
    }

}
