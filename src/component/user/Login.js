import React from 'react'
import {Button, Container, Grid,
    TextField, Typography, Link} from "@mui/material";
    
import { API_BASE_URL as BASE, USER } from '../../config/host-config';
import { redirect, useNavigate } from 'react-router-dom';

const Login = () => {

    const REQUEST_URL = BASE+USER+'/signin';

    const redirection = useNavigate();

    const fetchLogin = async() => {

        const res = await fetch(REQUEST_URL,{
            method:'POST',
            headers: {'content-type':'application/json'},
            body: JSON.stringify({
                'email':document.getElementById('email').value,
                'password':document.getElementById('password').value
            })
        });

        if(res.status === 400){
            alert(await res.text());
        }

        const { token, userName, email, role } = await res.json();

        localStorage.setItem('ACCESS_TOKEN', token);
        localStorage.setItem('LOGIN_USERNAME', userName);
        localStorage.setItem('USER_ROLE', role);

        redirection('/');
    }
    const loginHandler = e => {
        e.preventDefault();

        fetchLogin();
    
    }

    return (
        <Container component="main" maxWidth="xs" style={{ margin: "200px auto" }}>
            <Grid container spacing={2}>
                <Grid item xs={12}>
                    <Typography component="h1" variant="h5">
                        로그인
                    </Typography>
                </Grid>
            </Grid>
    
            <form noValidate onSubmit={loginHandler}>
    
                <Grid container spacing={2}>
                    <Grid item xs={12}>
                        <TextField
                            variant="outlined"
                            required
                            fullWidth
                            id="email"
                            label="email address"
                            name="email"
                            autoComplete="email"
                        />
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            variant="outlined"
                            required
                            fullWidth
                            name="password"
                            label="on your password"
                            type="password"
                            id="password"
                            autoComplete="current-password"
                        />
                    </Grid>
                    <Grid item xs={12}>
                        <Button
                            type="submit"
                            fullWidth
                            variant="contained"
                            color="primary"
                        >
                            로그인
                        </Button>
                    </Grid>
                </Grid>
            </form>
        </Container>
      );
}

export default Login