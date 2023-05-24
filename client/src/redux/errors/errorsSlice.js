import { createSlice } from "@reduxjs/toolkit";

export const errorsSlice = createSlice({
    name: 'errors',
    initialState: {
        value: []
    },
    reducers: {
        updateErrors(state, action) {
            state.value = action.payload
        }
    }
});

export const { updateErrors } = errorsSlice.actions;
export default errorsSlice.reducer;