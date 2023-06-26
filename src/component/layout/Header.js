import React, { useEffect, useState } from 'react';
import {AppBar, Toolbar, Grid, 
    Typography, Button} from "@mui/material";
import './header.css';
import { Link, useNavigate } from 'react-router-dom';
import { isLogin, getLoginUserInfo } from '../util/login-utils';

const Header = () => {

    const [userInfo, setUserInfo] = useState({});

    const { token, userName, role} = userInfo;

    const redirection = useNavigate();

    const logoutHandler = e =>{
        localStorage.clear();
        redirection('/login');
    }

    useEffect(()=>{
        setUserInfo(getLoginUserInfo());
    },[userInfo]);
  
    return (
        <AppBar position="fixed" style={{
            background: '#38d9a9',
            width: '100%'
        }}>
            <Toolbar>
                <Grid justify="space-between" container>
                    <Grid item flex={9}>
                        <div style={
                            {
                                display:'flex',
                                alignItems: 'center'
                            }
                        }>
                            <Typography variant="h4">
                                {
                                    isLogin() ? userName+'님': '오늘'
                                }의 할일
                            </Typography>   
                        </div>
                    </Grid>

                    <Grid item>
                        <div className='btn-group'>
                            {
                                isLogin()?(
                                <button className='logout-btn' onClick={logoutHandler}>로그아웃</button>):(
                                <>
                                <Link to="/login">로그인</Link>
                                <Link to="/join">회원가입</Link>
                                </>)
                            }
                        </div>
                    </Grid>

                </Grid>
            </Toolbar>
        </AppBar>
    );

}

export default Header