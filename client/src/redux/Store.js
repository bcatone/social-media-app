import { configureStore } from '@reduxjs/toolkit'
import meReducer from "./me/meSlice";
import errorsReducer from "./errors/errorsSlice";

export const store = configureStore({
    reducer: {
        me: meReducer,
        errors: errorsReducer
    }
});