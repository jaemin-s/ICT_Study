import React, { useState } from 'react'
import {Button, Container, Grid,
    TextField, Typography, Link} from "@mui/material";

const Join = () => {

    //상태변수로 회원가입 입력값 관리
    const [userValue, setUserValue] = useState({
        userName:'',
        password:'',
        email:''
    });

    const [message, setMessage] = useState({
        userName:'',
        password:'',
        passwordCheck:'',
        email:''
    });

    const [correct, setCorrect] = useState({
        userName:false,
        password:false,
        passwordCheck:false,
        email:false
    });

    //검증 데이터를 상태변수에 저장하는 함수
    const saveInputState = ({inputVal, flag, msg, key}) => {
        setMessage({
            ...message,
            [key]: msg
        });

        setCorrect({
            ...correct,
            [key]:flag
        });

        
        inputVal !== 'pass' && setUserValue({
            ...userValue,
            [key]:inputVal
        });
    }

    const joinButtonClickHandler = e => {
        e.preventDefault();
        console.log(userValue);
        console.log(message);
        console.log(correct);
    }

    const nameHandler = e => {

        const inputVal = e.target.value;

        const nameRegex = /^[가-힣]{2,5}$/;

        let msg;
        let flag = false;
        if(!inputVal) {
            msg = '유저 이름은 필수입니다.';
        } else if(!nameRegex.test(inputVal)){
            msg = '2~5글자 사이의 한글로 작성하세요';
        } else {
            msg = '사용 가능한 이름입니다.';
            flag = true;
        }

        saveInputState({inputVal,flag,msg,key:'userName'});

    }

    const passwordHandler = e => {

        document.getElementById('password-check').value = '';
        document.getElementById('check-text').textContent = '';
        setMessage({...message,passwordCheck:''});
        setCorrect({...correct,passwordCheck:false});

        const inputVal = e.target.value;

        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;

        let msg;
        let flag = false;
        if(!inputVal) {
            msg = '비밀번호는 필수입니다.';
        } else if(!pwRegex.test(inputVal)){
            msg = '영문, 숫자, 특수문자를 포함한 8~20글자를 입력하세요';
        } else {
            msg = '사용 가능한 비밀번호입니다.';
            flag = true;
        }

        saveInputState({inputVal,flag,msg,key:'password'});
    }

    const pwCheckHandler = e => {
        const inputVal = e.target.value;

        let msg;
        let flag = false;
        if(!inputVal) {
            msg = '비밀번호 확인은 필수입니다.';
        } else if(inputVal!==userValue.password){
            msg = '비밀번호가 다릅니다';
        } else {
            msg = '비밀번호가 일치 합니다';
            flag = true;
        }

        saveInputState({inputVal:'pass',flag,msg,key:'passwordCheck'});
    }

    const emailHandler = e => {
        const inputVal = e.target.value;

        let msg;
        let flag = false;
        if(!inputVal) {
            msg = '이메일은 필수입니다';
        // } else if(){
        //     msg = '';
        } else {
            msg = '사용 가능한 이메일입니다.';
            flag = true;
        }

        saveInputState({inputVal,flag,msg,key:'email'});
    }



    return (
        <Container component="main" maxWidth="xs" style={{ margin: "200px auto" }}>
            <form noValidate>
                <Grid container spacing={2}>
                    <Grid item xs={12}>
                        <Typography component="h1" variant="h5">
                            계정 생성
                        </Typography>
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            autoComplete="fname"
                            name="username"
                            variant="outlined"
                            required
                            fullWidth
                            id="username"
                            label="유저 이름"
                            autoFocus
                            onChange={nameHandler}
                        />
                        <span style={
                            correct.userName ? {color:'green'}:{color:'red'}
                        }>{message.userName}</span>
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            variant="outlined"
                            required
                            fullWidth
                            id="email"
                            label="이메일 주소"
                            name="email"
                            autoComplete="email"
                            onChange={emailHandler}
                        />
                        <span style={
                            correct.email ? {color:'green'}:{color:'red'}
                        }>{message.email}</span>
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            variant="outlined"
                            required
                            fullWidth
                            name="password"
                            label="패스워드"
                            type="password"
                            id="password"
                            autoComplete="current-password"
                            onChange={passwordHandler}
                        />
                        <span style={
                            correct.password ? {color:'green'}:{color:'red'}
                        }>{message.password}</span>
                    </Grid>
    
                    <Grid item xs={12}>
                        <TextField
                            variant="outlined"
                            required
                            fullWidth
                            name="password-check"
                            label="패스워드 확인"
                            type="password"
                            id="password-check"
                            autoComplete="check-password"
                            onChange={pwCheckHandler}
                        />
                        <span id="check-text" style={
                            correct.passwordCheck ? {color:'green'}:{color:'red'}
                        }>{message.passwordCheck}</span>
                    </Grid>
    
                    <Grid item xs={12}>
                        <Button 
                          type="submit" 
                          fullWidth 
                          variant="contained" 
                          style={{background: '#38d9a9'}}
                          onClick={joinButtonClickHandler}
                        >
                            계정 생성
                        </Button>
                    </Grid>
                </Grid>
                <Grid container justify="flex-end">
                    <Grid item>
                        <Link href="/login" variant="body2">
                            이미 계정이 있습니까? 로그인 하세요.
                        </Link>
                    </Grid>
                </Grid>
            </form>
        </Container>
    );
}

export default Join