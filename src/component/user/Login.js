import React from 'react'
import {Button, Container, Grid,
    TextField, Typography, Link} from "@mui/material";
    
import { API_BASE_URL as BASE, USER } from '../../config/host-config';
import { redirect, useNavigate } from 'react-router-dom';

const Login = () => {

    const REQUEST_URL = BASE+USER+'/signin';

    const redirection = useNavigate();

    const loginHandler = async e => {
        e.preventDefault();

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
        }else{
            console.log(await res.json());
            alert('로그인 성공');
            redirection('/');
        }
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