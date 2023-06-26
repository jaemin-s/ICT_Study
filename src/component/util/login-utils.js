
export const getLoginUserInfo = () => {
    return {
        token : localStorage.getItem('ACCESS_TOKEN'),
        userName : localStorage.getItem('LOGIN_USERNAME'),
        role : localStorage.getItem('USER_ROLE')
    };
};

export const isLogin = () => !!localStorage.getItem('ACCESS_TOKEN');