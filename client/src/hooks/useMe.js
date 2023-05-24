import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { updateMe } from "../redux/me/meSlice";
//import { updateErrors } from "../redux/errors/errorsSlice";

function useMe() {
    const dispatch = useDispatch();
    const me = useSelector(state => state.me.value);

    useEffect(() => {
        fetch("/me")
        .then(resp => {
            if (resp.ok) {
                resp.json()
                .then(user => {
                    console.log(user);
                    dispatch(updateMe(user));
                });
            } else {
                resp.json()
                .then(errorData => {
                    console.log(errorData);
                    dispatch(updateMe({}));
                    //dispatch(updateErrors([...errors, {me: [errorData]}]));
                })
            }
        })
    },[]);

    console.log(me);

    return { me };
}

export default useMe;