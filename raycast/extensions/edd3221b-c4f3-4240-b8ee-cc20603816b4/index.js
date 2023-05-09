"use strict";var gn=Object.create;var M=Object.defineProperty;var yn=Object.getOwnPropertyDescriptor;var Sn=Object.getOwnPropertyNames;var xn=Object.getPrototypeOf,bn=Object.prototype.hasOwnProperty;var c=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),wn=(e,t)=>{for(var r in t)M(e,r,{get:t[r],enumerable:!0})},Te=(e,t,r,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let s of Sn(t))!bn.call(e,s)&&s!==r&&M(e,s,{get:()=>t[s],enumerable:!(n=yn(t,s))||n.enumerable});return e};var te=(e,t,r)=>(r=e!=null?gn(xn(e)):{},Te(t||!e||!e.__esModule?M(r,"default",{value:e,enumerable:!0}):r,e)),vn=e=>Te(M({},"__esModule",{value:!0}),e);var qe=c((Ts,Re)=>{Re.exports=Ae;Ae.sync=In;var Ce=require("fs");function En(e,t){var r=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!r||(r=r.split(";"),r.indexOf("")!==-1))return!0;for(var n=0;n<r.length;n++){var s=r[n].toLowerCase();if(s&&e.substr(-s.length).toLowerCase()===s)return!0}return!1}function Ge(e,t,r){return!e.isSymbolicLink()&&!e.isFile()?!1:En(t,r)}function Ae(e,t,r){Ce.stat(e,function(n,s){r(n,n?!1:Ge(s,e,t))})}function In(e,t){return Ge(Ce.statSync(e),e,t)}});var ke=c((Cs,Le)=>{Le.exports=Oe;Oe.sync=Pn;var Ne=require("fs");function Oe(e,t,r){Ne.stat(e,function(n,s){r(n,n?!1:$e(s,t))})}function Pn(e,t){return $e(Ne.statSync(e),t)}function $e(e,t){return e.isFile()&&Tn(e,t)}function Tn(e,t){var r=e.mode,n=e.uid,s=e.gid,o=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),i=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),u=parseInt("010",8),l=parseInt("001",8),f=a|u,g=r&l||r&u&&s===i||r&a&&n===o||r&f&&o===0;return g}});var Be=c((As,_e)=>{var Gs=require("fs"),j;process.platform==="win32"||global.TESTING_WINDOWS?j=qe():j=ke();_e.exports=ne;ne.sync=Cn;function ne(e,t,r){if(typeof t=="function"&&(r=t,t={}),!r){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(n,s){ne(e,t||{},function(o,i){o?s(o):n(i)})})}j(e,t||{},function(n,s){n&&(n.code==="EACCES"||t&&t.ignoreErrors)&&(n=null,s=!1),r(n,s)})}function Cn(e,t){try{return j.sync(e,t||{})}catch(r){if(t&&t.ignoreErrors||r.code==="EACCES")return!1;throw r}}});var He=c((Rs,Xe)=>{var I=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",Fe=require("path"),Gn=I?";":":",Me=Be(),je=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),Ue=(e,t)=>{let r=t.colon||Gn,n=e.match(/\//)||I&&e.match(/\\/)?[""]:[...I?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(r)],s=I?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",o=I?s.split(r):[""];return I&&e.indexOf(".")!==-1&&o[0]!==""&&o.unshift(""),{pathEnv:n,pathExt:o,pathExtExe:s}},De=(e,t,r)=>{typeof t=="function"&&(r=t,t={}),t||(t={});let{pathEnv:n,pathExt:s,pathExtExe:o}=Ue(e,t),i=[],a=l=>new Promise((f,g)=>{if(l===n.length)return t.all&&i.length?f(i):g(je(e));let h=n[l],y=/^".*"$/.test(h)?h.slice(1,-1):h,S=Fe.join(y,e),x=!y&&/^\.[\\\/]/.test(e)?e.slice(0,2)+S:S;f(u(x,l,0))}),u=(l,f,g)=>new Promise((h,y)=>{if(g===s.length)return h(a(f+1));let S=s[g];Me(l+S,{pathExt:o},(x,E)=>{if(!x&&E)if(t.all)i.push(l+S);else return h(l+S);return h(u(l,f,g+1))})});return r?a(0).then(l=>r(null,l),r):a(0)},An=(e,t)=>{t=t||{};let{pathEnv:r,pathExt:n,pathExtExe:s}=Ue(e,t),o=[];for(let i=0;i<r.length;i++){let a=r[i],u=/^".*"$/.test(a)?a.slice(1,-1):a,l=Fe.join(u,e),f=!u&&/^\.[\\\/]/.test(e)?e.slice(0,2)+l:l;for(let g=0;g<n.length;g++){let h=f+n[g];try{if(Me.sync(h,{pathExt:s}))if(t.all)o.push(h);else return h}catch{}}}if(t.all&&o.length)return o;if(t.nothrow)return null;throw je(e)};Xe.exports=De;De.sync=An});var se=c((qs,re)=>{"use strict";var Ke=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(n=>n.toUpperCase()==="PATH")||"Path"};re.exports=Ke;re.exports.default=Ke});var Qe=c((Ns,Ve)=>{"use strict";var We=require("path"),Rn=He(),qn=se();function ze(e,t){let r=e.options.env||process.env,n=process.cwd(),s=e.options.cwd!=null,o=s&&process.chdir!==void 0&&!process.chdir.disabled;if(o)try{process.chdir(e.options.cwd)}catch{}let i;try{i=Rn.sync(e.command,{path:r[qn({env:r})],pathExt:t?We.delimiter:void 0})}catch{}finally{o&&process.chdir(n)}return i&&(i=We.resolve(s?e.options.cwd:"",i)),i}function Nn(e){return ze(e)||ze(e,!0)}Ve.exports=Nn});var Ye=c((Os,ie)=>{"use strict";var oe=/([()\][%!^"`<>&|;, *?])/g;function On(e){return e=e.replace(oe,"^$1"),e}function $n(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(oe,"^$1"),t&&(e=e.replace(oe,"^$1")),e}ie.exports.command=On;ie.exports.argument=$n});var Je=c(($s,Ze)=>{"use strict";Ze.exports=/^#!(.*)/});var tt=c((Ls,et)=>{"use strict";var Ln=Je();et.exports=(e="")=>{let t=e.match(Ln);if(!t)return null;let[r,n]=t[0].replace(/#! ?/,"").split(" "),s=r.split("/").pop();return s==="env"?n:n?`${s} ${n}`:s}});var rt=c((ks,nt)=>{"use strict";var ae=require("fs"),kn=tt();function _n(e){let r=Buffer.alloc(150),n;try{n=ae.openSync(e,"r"),ae.readSync(n,r,0,150,0),ae.closeSync(n)}catch{}return kn(r.toString())}nt.exports=_n});var at=c((_s,it)=>{"use strict";var Bn=require("path"),st=Qe(),ot=Ye(),Fn=rt(),Mn=process.platform==="win32",jn=/\.(?:com|exe)$/i,Un=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function Dn(e){e.file=st(e);let t=e.file&&Fn(e.file);return t?(e.args.unshift(e.file),e.command=t,st(e)):e.file}function Xn(e){if(!Mn)return e;let t=Dn(e),r=!jn.test(t);if(e.options.forceShell||r){let n=Un.test(t);e.command=Bn.normalize(e.command),e.command=ot.command(e.command),e.args=e.args.map(o=>ot.argument(o,n));let s=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${s}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Hn(e,t,r){t&&!Array.isArray(t)&&(r=t,t=null),t=t?t.slice(0):[],r=Object.assign({},r);let n={command:e,args:t,options:r,file:void 0,original:{command:e,args:t}};return r.shell?n:Xn(n)}it.exports=Hn});var lt=c((Bs,ut)=>{"use strict";var ce=process.platform==="win32";function ue(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Kn(e,t){if(!ce)return;let r=e.emit;e.emit=function(n,s){if(n==="exit"){let o=ct(s,t,"spawn");if(o)return r.call(e,"error",o)}return r.apply(e,arguments)}}function ct(e,t){return ce&&e===1&&!t.file?ue(t.original,"spawn"):null}function Wn(e,t){return ce&&e===1&&!t.file?ue(t.original,"spawnSync"):null}ut.exports={hookChildProcess:Kn,verifyENOENT:ct,verifyENOENTSync:Wn,notFoundError:ue}});var pt=c((Fs,P)=>{"use strict";var dt=require("child_process"),le=at(),de=lt();function ft(e,t,r){let n=le(e,t,r),s=dt.spawn(n.command,n.args,n.options);return de.hookChildProcess(s,n),s}function zn(e,t,r){let n=le(e,t,r),s=dt.spawnSync(n.command,n.args,n.options);return s.error=s.error||de.verifyENOENTSync(s.status,n),s}P.exports=ft;P.exports.spawn=ft;P.exports.sync=zn;P.exports._parse=le;P.exports._enoent=de});var ht=c((Ms,mt)=>{"use strict";mt.exports=e=>{let t=typeof e=="string"?`
`:`
`.charCodeAt(),r=typeof e=="string"?"\r":"\r".charCodeAt();return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===r&&(e=e.slice(0,e.length-1)),e}});var St=c((js,$)=>{"use strict";var O=require("path"),gt=se(),yt=e=>{e={cwd:process.cwd(),path:process.env[gt()],execPath:process.execPath,...e};let t,r=O.resolve(e.cwd),n=[];for(;t!==r;)n.push(O.join(r,"node_modules/.bin")),t=r,r=O.resolve(r,"..");let s=O.resolve(e.cwd,e.execPath,"..");return n.push(s),n.concat(e.path).join(O.delimiter)};$.exports=yt;$.exports.default=yt;$.exports.env=e=>{e={env:process.env,...e};let t={...e.env},r=gt({env:t});return e.path=t[r],t[r]=$.exports(e),t}});var bt=c((Us,fe)=>{"use strict";var xt=(e,t)=>{for(let r of Reflect.ownKeys(t))Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(t,r));return e};fe.exports=xt;fe.exports.default=xt});var vt=c((Ds,D)=>{"use strict";var Vn=bt(),U=new WeakMap,wt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let r,n=0,s=e.displayName||e.name||"<anonymous>",o=function(...i){if(U.set(o,++n),n===1)r=e.apply(this,i),e=null;else if(t.throw===!0)throw new Error(`Function \`${s}\` can only be called once`);return r};return Vn(o,e),U.set(o,n),o};D.exports=wt;D.exports.default=wt;D.exports.callCount=e=>{if(!U.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return U.get(e)}});var Et=c(X=>{"use strict";Object.defineProperty(X,"__esModule",{value:!0});X.SIGNALS=void 0;var Qn=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];X.SIGNALS=Qn});var pe=c(T=>{"use strict";Object.defineProperty(T,"__esModule",{value:!0});T.SIGRTMAX=T.getRealtimeSignals=void 0;var Yn=function(){let e=Pt-It+1;return Array.from({length:e},Zn)};T.getRealtimeSignals=Yn;var Zn=function(e,t){return{name:`SIGRT${t+1}`,number:It+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},It=34,Pt=64;T.SIGRTMAX=Pt});var Tt=c(H=>{"use strict";Object.defineProperty(H,"__esModule",{value:!0});H.getSignals=void 0;var Jn=require("os"),er=Et(),tr=pe(),nr=function(){let e=(0,tr.getRealtimeSignals)();return[...er.SIGNALS,...e].map(rr)};H.getSignals=nr;var rr=function({name:e,number:t,description:r,action:n,forced:s=!1,standard:o}){let{signals:{[e]:i}}=Jn.constants,a=i!==void 0;return{name:e,number:a?i:t,description:r,supported:a,action:n,forced:s,standard:o}}});var Gt=c(C=>{"use strict";Object.defineProperty(C,"__esModule",{value:!0});C.signalsByNumber=C.signalsByName=void 0;var sr=require("os"),Ct=Tt(),or=pe(),ir=function(){return(0,Ct.getSignals)().reduce(ar,{})},ar=function(e,{name:t,number:r,description:n,supported:s,action:o,forced:i,standard:a}){return{...e,[t]:{name:t,number:r,description:n,supported:s,action:o,forced:i,standard:a}}},cr=ir();C.signalsByName=cr;var ur=function(){let e=(0,Ct.getSignals)(),t=or.SIGRTMAX+1,r=Array.from({length:t},(n,s)=>lr(s,e));return Object.assign({},...r)},lr=function(e,t){let r=dr(e,t);if(r===void 0)return{};let{name:n,description:s,supported:o,action:i,forced:a,standard:u}=r;return{[e]:{name:n,number:e,description:s,supported:o,action:i,forced:a,standard:u}}},dr=function(e,t){let r=t.find(({name:n})=>sr.constants.signals[n]===e);return r!==void 0?r:t.find(n=>n.number===e)},fr=ur();C.signalsByNumber=fr});var Rt=c((zs,At)=>{"use strict";var{signalsByName:pr}=Gt(),mr=({timedOut:e,timeout:t,errorCode:r,signal:n,signalDescription:s,exitCode:o,isCanceled:i})=>e?`timed out after ${t} milliseconds`:i?"was canceled":r!==void 0?`failed with ${r}`:n!==void 0?`was killed with ${n} (${s})`:o!==void 0?`failed with exit code ${o}`:"failed",hr=({stdout:e,stderr:t,all:r,error:n,signal:s,exitCode:o,command:i,escapedCommand:a,timedOut:u,isCanceled:l,killed:f,parsed:{options:{timeout:g}}})=>{o=o===null?void 0:o,s=s===null?void 0:s;let h=s===void 0?void 0:pr[s].description,y=n&&n.code,x=`Command ${mr({timedOut:u,timeout:g,errorCode:y,signal:s,signalDescription:h,exitCode:o,isCanceled:l})}: ${i}`,E=Object.prototype.toString.call(n)==="[object Error]",B=E?`${x}
${n.message}`:x,F=[B,t,e].filter(Boolean).join(`
`);return E?(n.originalMessage=n.message,n.message=F):n=new Error(F),n.shortMessage=B,n.command=i,n.escapedCommand=a,n.exitCode=o,n.signal=s,n.signalDescription=h,n.stdout=e,n.stderr=t,r!==void 0&&(n.all=r),"bufferedData"in n&&delete n.bufferedData,n.failed=!0,n.timedOut=Boolean(u),n.isCanceled=l,n.killed=f&&!u,n};At.exports=hr});var Nt=c((Vs,me)=>{"use strict";var K=["stdin","stdout","stderr"],gr=e=>K.some(t=>e[t]!==void 0),qt=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return K.map(n=>e[n]);if(gr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${K.map(n=>`\`${n}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let r=Math.max(t.length,K.length);return Array.from({length:r},(n,s)=>t[s])};me.exports=qt;me.exports.node=e=>{let t=qt(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var Ot=c((Qs,W)=>{W.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&W.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&W.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var Bt=c((Ys,R)=>{var d=global.process,w=function(e){return e&&typeof e=="object"&&typeof e.removeListener=="function"&&typeof e.emit=="function"&&typeof e.reallyExit=="function"&&typeof e.listeners=="function"&&typeof e.kill=="function"&&typeof e.pid=="number"&&typeof e.on=="function"};w(d)?($t=require("assert"),G=Ot(),Lt=/^win/i.test(d.platform),L=require("events"),typeof L!="function"&&(L=L.EventEmitter),d.__signal_exit_emitter__?p=d.__signal_exit_emitter__:(p=d.__signal_exit_emitter__=new L,p.count=0,p.emitted={}),p.infinite||(p.setMaxListeners(1/0),p.infinite=!0),R.exports=function(e,t){if(!w(global.process))return function(){};$t.equal(typeof e,"function","a callback must be provided for exit handler"),A===!1&&he();var r="exit";t&&t.alwaysLast&&(r="afterexit");var n=function(){p.removeListener(r,e),p.listeners("exit").length===0&&p.listeners("afterexit").length===0&&z()};return p.on(r,e),n},z=function(){!A||!w(global.process)||(A=!1,G.forEach(function(t){try{d.removeListener(t,V[t])}catch{}}),d.emit=Q,d.reallyExit=ge,p.count-=1)},R.exports.unload=z,v=function(t,r,n){p.emitted[t]||(p.emitted[t]=!0,p.emit(t,r,n))},V={},G.forEach(function(e){V[e]=function(){if(!!w(global.process)){var r=d.listeners(e);r.length===p.count&&(z(),v("exit",null,e),v("afterexit",null,e),Lt&&e==="SIGHUP"&&(e="SIGINT"),d.kill(d.pid,e))}}}),R.exports.signals=function(){return G},A=!1,he=function(){A||!w(global.process)||(A=!0,p.count+=1,G=G.filter(function(t){try{return d.on(t,V[t]),!0}catch{return!1}}),d.emit=_t,d.reallyExit=kt)},R.exports.load=he,ge=d.reallyExit,kt=function(t){!w(global.process)||(d.exitCode=t||0,v("exit",d.exitCode,null),v("afterexit",d.exitCode,null),ge.call(d,d.exitCode))},Q=d.emit,_t=function(t,r){if(t==="exit"&&w(global.process)){r!==void 0&&(d.exitCode=r);var n=Q.apply(this,arguments);return v("exit",d.exitCode,null),v("afterexit",d.exitCode,null),n}else return Q.apply(this,arguments)}):R.exports=function(){return function(){}};var $t,G,Lt,L,p,z,v,V,A,he,ge,kt,Q,_t});var Mt=c((Zs,Ft)=>{"use strict";var yr=require("os"),Sr=Bt(),xr=1e3*5,br=(e,t="SIGTERM",r={})=>{let n=e(t);return wr(e,t,r,n),n},wr=(e,t,r,n)=>{if(!vr(t,r,n))return;let s=Ir(r),o=setTimeout(()=>{e("SIGKILL")},s);o.unref&&o.unref()},vr=(e,{forceKillAfterTimeout:t},r)=>Er(e)&&t!==!1&&r,Er=e=>e===yr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",Ir=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return xr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},Pr=(e,t)=>{e.kill()&&(t.isCanceled=!0)},Tr=(e,t,r)=>{e.kill(t),r(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},Cr=(e,{timeout:t,killSignal:r="SIGTERM"},n)=>{if(t===0||t===void 0)return n;let s,o=new Promise((a,u)=>{s=setTimeout(()=>{Tr(e,r,u)},t)}),i=n.finally(()=>{clearTimeout(s)});return Promise.race([o,i])},Gr=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},Ar=async(e,{cleanup:t,detached:r},n)=>{if(!t||r)return n;let s=Sr(()=>{e.kill()});return n.finally(()=>{s()})};Ft.exports={spawnedKill:br,spawnedCancel:Pr,setupTimeout:Cr,validateTimeout:Gr,setExitHandler:Ar}});var Ut=c((Js,jt)=>{"use strict";var b=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";b.writable=e=>b(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";b.readable=e=>b(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";b.duplex=e=>b.writable(e)&&b.readable(e);b.transform=e=>b.duplex(e)&&typeof e._transform=="function";jt.exports=b});var Xt=c((eo,Dt)=>{"use strict";var{PassThrough:Rr}=require("stream");Dt.exports=e=>{e={...e};let{array:t}=e,{encoding:r}=e,n=r==="buffer",s=!1;t?s=!(r||n):r=r||"utf8",n&&(r=null);let o=new Rr({objectMode:s});r&&o.setEncoding(r);let i=0,a=[];return o.on("data",u=>{a.push(u),s?i=a.length:i+=u.length}),o.getBufferedValue=()=>t?a:n?Buffer.concat(a,i):a.join(""),o.getBufferedLength=()=>i,o}});var Ht=c((to,k)=>{"use strict";var{constants:qr}=require("buffer"),Nr=require("stream"),{promisify:Or}=require("util"),$r=Xt(),Lr=Or(Nr.pipeline),Y=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function ye(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:r}=t,n=$r(t);return await new Promise((s,o)=>{let i=a=>{a&&n.getBufferedLength()<=qr.MAX_LENGTH&&(a.bufferedData=n.getBufferedValue()),o(a)};(async()=>{try{await Lr(e,n),s()}catch(a){i(a)}})(),n.on("data",()=>{n.getBufferedLength()>r&&i(new Y)})}),n.getBufferedValue()}k.exports=ye;k.exports.buffer=(e,t)=>ye(e,{...t,encoding:"buffer"});k.exports.array=(e,t)=>ye(e,{...t,array:!0});k.exports.MaxBufferError=Y});var Wt=c((no,Kt)=>{"use strict";var{PassThrough:kr}=require("stream");Kt.exports=function(){var e=[],t=new kr({objectMode:!0});return t.setMaxListeners(0),t.add=r,t.isEmpty=n,t.on("unpipe",s),Array.prototype.slice.call(arguments).forEach(r),t;function r(o){return Array.isArray(o)?(o.forEach(r),this):(e.push(o),o.once("end",s.bind(null,o)),o.once("error",t.emit.bind(t,"error")),o.pipe(t,{end:!1}),this)}function n(){return e.length==0}function s(o){e=e.filter(function(i){return i!==o}),!e.length&&t.readable&&t.end()}}});var Yt=c((ro,Qt)=>{"use strict";var Vt=Ut(),zt=Ht(),_r=Wt(),Br=(e,t)=>{t===void 0||e.stdin===void 0||(Vt(t)?t.pipe(e.stdin):e.stdin.end(t))},Fr=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let r=_r();return e.stdout&&r.add(e.stdout),e.stderr&&r.add(e.stderr),r},Se=async(e,t)=>{if(!!e){e.destroy();try{return await t}catch(r){return r.bufferedData}}},xe=(e,{encoding:t,buffer:r,maxBuffer:n})=>{if(!(!e||!r))return t?zt(e,{encoding:t,maxBuffer:n}):zt.buffer(e,{maxBuffer:n})},Mr=async({stdout:e,stderr:t,all:r},{encoding:n,buffer:s,maxBuffer:o},i)=>{let a=xe(e,{encoding:n,buffer:s,maxBuffer:o}),u=xe(t,{encoding:n,buffer:s,maxBuffer:o}),l=xe(r,{encoding:n,buffer:s,maxBuffer:o*2});try{return await Promise.all([i,a,u,l])}catch(f){return Promise.all([{error:f,signal:f.signal,timedOut:f.timedOut},Se(e,a),Se(t,u),Se(r,l)])}},jr=({input:e})=>{if(Vt(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};Qt.exports={handleInput:Br,makeAllStream:Fr,getSpawnedResult:Mr,validateInputSync:jr}});var Jt=c((so,Zt)=>{"use strict";var Ur=(async()=>{})().constructor.prototype,Dr=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(Ur,e)]),Xr=(e,t)=>{for(let[r,n]of Dr){let s=typeof t=="function"?(...o)=>Reflect.apply(n.value,t(),o):n.value.bind(t);Reflect.defineProperty(e,r,{...n,value:s})}return e},Hr=e=>new Promise((t,r)=>{e.on("exit",(n,s)=>{t({exitCode:n,signal:s})}),e.on("error",n=>{r(n)}),e.stdin&&e.stdin.on("error",n=>{r(n)})});Zt.exports={mergePromise:Xr,getSpawnedPromise:Hr}});var nn=c((oo,tn)=>{"use strict";var en=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],Kr=/^[\w.-]+$/,Wr=/"/g,zr=e=>typeof e!="string"||Kr.test(e)?e:`"${e.replace(Wr,'\\"')}"`,Vr=(e,t)=>en(e,t).join(" "),Qr=(e,t)=>en(e,t).map(r=>zr(r)).join(" "),Yr=/ +/g,Zr=e=>{let t=[];for(let r of e.trim().split(Yr)){let n=t[t.length-1];n&&n.endsWith("\\")?t[t.length-1]=`${n.slice(0,-1)} ${r}`:t.push(r)}return t};tn.exports={joinCommand:Vr,getEscapedCommand:Qr,parseCommand:Zr}});var ln=c((io,q)=>{"use strict";var Jr=require("path"),be=require("child_process"),es=pt(),ts=ht(),ns=St(),rs=vt(),Z=Rt(),sn=Nt(),{spawnedKill:ss,spawnedCancel:os,setupTimeout:is,validateTimeout:as,setExitHandler:cs}=Mt(),{handleInput:us,getSpawnedResult:ls,makeAllStream:ds,validateInputSync:fs}=Yt(),{mergePromise:rn,getSpawnedPromise:ps}=Jt(),{joinCommand:on,parseCommand:an,getEscapedCommand:cn}=nn(),ms=1e3*1e3*100,hs=({env:e,extendEnv:t,preferLocal:r,localDir:n,execPath:s})=>{let o=t?{...process.env,...e}:e;return r?ns.env({env:o,cwd:n,execPath:s}):o},un=(e,t,r={})=>{let n=es._parse(e,t,r);return e=n.command,t=n.args,r=n.options,r={maxBuffer:ms,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:r.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...r},r.env=hs(r),r.stdio=sn(r),process.platform==="win32"&&Jr.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:r,parsed:n}},_=(e,t,r)=>typeof t!="string"&&!Buffer.isBuffer(t)?r===void 0?void 0:"":e.stripFinalNewline?ts(t):t,J=(e,t,r)=>{let n=un(e,t,r),s=on(e,t),o=cn(e,t);as(n.options);let i;try{i=be.spawn(n.file,n.args,n.options)}catch(y){let S=new be.ChildProcess,x=Promise.reject(Z({error:y,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:n,timedOut:!1,isCanceled:!1,killed:!1}));return rn(S,x)}let a=ps(i),u=is(i,n.options,a),l=cs(i,n.options,u),f={isCanceled:!1};i.kill=ss.bind(null,i.kill.bind(i)),i.cancel=os.bind(null,i,f);let h=rs(async()=>{let[{error:y,exitCode:S,signal:x,timedOut:E},B,F,hn]=await ls(i,n.options,l),ve=_(n.options,B),Ee=_(n.options,F),Ie=_(n.options,hn);if(y||S!==0||x!==null){let Pe=Z({error:y,exitCode:S,signal:x,stdout:ve,stderr:Ee,all:Ie,command:s,escapedCommand:o,parsed:n,timedOut:E,isCanceled:f.isCanceled,killed:i.killed});if(!n.options.reject)return Pe;throw Pe}return{command:s,escapedCommand:o,exitCode:0,stdout:ve,stderr:Ee,all:Ie,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return us(i,n.options.input),i.all=ds(i,n.options),rn(i,h)};q.exports=J;q.exports.sync=(e,t,r)=>{let n=un(e,t,r),s=on(e,t),o=cn(e,t);fs(n.options);let i;try{i=be.spawnSync(n.file,n.args,n.options)}catch(l){throw Z({error:l,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:n,timedOut:!1,isCanceled:!1,killed:!1})}let a=_(n.options,i.stdout,i.error),u=_(n.options,i.stderr,i.error);if(i.error||i.status!==0||i.signal!==null){let l=Z({stdout:a,stderr:u,error:i.error,signal:i.signal,exitCode:i.status,command:s,escapedCommand:o,parsed:n,timedOut:i.error&&i.error.code==="ETIMEDOUT",isCanceled:!1,killed:i.signal!==null});if(!n.options.reject)return l;throw l}return{command:s,escapedCommand:o,exitCode:0,stdout:a,stderr:u,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};q.exports.command=(e,t)=>{let[r,...n]=an(e);return J(r,n,t)};q.exports.commandSync=(e,t)=>{let[r,...n]=an(e);return J.sync(r,n,t)};q.exports.node=(e,t,r={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(r=t,t=[]);let n=sn.node(r),s=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:o=process.execPath,nodeOptions:i=s}=r;return J(o,[...i,e,...Array.isArray(t)?t:[]],{...r,stdin:void 0,stdout:void 0,stderr:void 0,stdio:n,shell:!1})}});var Is={};wn(Is,{default:()=>Es});module.exports=vn(Is);var m=require("@raycast/api"),pn=te(require("react"));var dn=te(require("node:process"),1),fn=te(ln(),1);async function ee(e){if(dn.default.platform!=="darwin")throw new Error("macOS only");let{stdout:t}=await(0,fn.default)("osascript",["-e",e]);return t}var mn=require("child_process"),N=require("react/jsx-runtime");function gs(e){let t=e.split("/");return t[t.length-1].replace(".app","")}function ys(e){let t=`${e}/Contents/Info.plist`,r=["CFBundleIconFile","CFBundleIconName"],n=null;for(let o of r)try{n=(0,mn.execSync)(["plutil","-extract",o,"raw",'"'+t+'"'].join(" ")).toString().trim();break}catch{continue}if(!n)return"";n.endsWith(".icns")||(n=`${n}.icns`);let s=`${e}/Contents/Resources/${n}`;return console.log(s),s}async function Ss(){return(await ee(`
    set appPaths to {}
    tell application "System Events"
      repeat with aProcess in (get file of every process whose background only is false)
        set processPath to POSIX path of aProcess
        set end of appPaths to processPath
      end repeat
    end tell

    return appPaths
  `)).split(", ").map(t=>t.trim())}function xs(e){return ee(`tell application "${e}" to quit`)}function bs(e){return ee(`tell application "${e}"
                            repeat while its running
                              quit
                              delay 0.5
	                          end repeat
	                          activate
                        end tell`)}function ws(e){try{return xs(e),(0,m.showToast)({style:m.Toast.Style.Success,title:`Quit ${e}`}),!0}catch{return(0,m.showToast)({style:m.Toast.Style.Failure,title:`Unable to quit ${e}`}),!1}}function vs(e){try{return bs(e),(0,m.showToast)({style:m.Toast.Style.Success,title:`Restarted ${e}`}),!0}catch{return(0,m.showToast)({style:m.Toast.Style.Failure,title:`Unable to restart ${e}`}),!1}}var we=class extends pn.default.Component{constructor(t){super(t),this.state={apps:[],isLoading:!0}}componentDidMount(){Ss().then(t=>{let r=t.filter(i=>i.endsWith(".app")),n=r.map(i=>gs(i)),s=r.map(i=>ys(i)),o=n.map((i,a)=>({name:i,iconPath:s[a]}));this.setState({apps:o,isLoading:!1})})}render(){return(0,N.jsx)(m.List,{isLoading:this.state.isLoading,children:this.state.apps.map(t=>(0,N.jsx)(m.List.Item,{title:t.name,icon:t.iconPath,actions:(0,N.jsxs)(m.ActionPanel,{children:[(0,N.jsx)(m.Action,{title:"Quit",onAction:()=>{ws(t.name)&&this.setState({apps:this.state.apps.filter(n=>n.name!==t.name)})}}),(0,N.jsx)(m.Action,{title:"Restart",onAction:()=>{vs(t.name)}})]})},t.name))})}},Es=we;0&&(module.exports={});
