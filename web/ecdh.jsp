<html>
    <head>
        <title>JavaScript ECDH Key Exchange Demo</title>

        <script language="JavaScript" type="text/javascript" src="jsbn.js"></script>
        <script language="JavaScript" type="text/javascript" src="jsbn2.js"></script>
        <script language="JavaScript" type="text/javascript" src="prng4.js"></script>
        <script language="JavaScript" type="text/javascript" src="rng.js"></script>
        <script language="JavaScript" type="text/javascript" src="ec.js"></script>
        <script language="JavaScript" type="text/javascript" src="sec.js"></script>

        <script language="JavaScript">
        <!--
            function do_status(s) {
                document.ecdhtest.status.value = s;
            }

            function set_ec_params(name) {
                var c = getSECCurveByName(name);

                document.ecdhtest.q.value = c.getCurve().getQ().toString();
                document.ecdhtest.a.value = c.getCurve().getA().toBigInteger().toString();
                document.ecdhtest.b.value = c.getCurve().getB().toBigInteger().toString();
                document.ecdhtest.gx.value = c.getG().getX().toBigInteger().toString();
                document.ecdhtest.gy.value = c.getG().getY().toBigInteger().toString();
                document.ecdhtest.n.value = c.getN().toString();

                // Changing EC params invalidates everything else
                document.ecdhtest.alice_priv.value = "";
                document.ecdhtest.bob_priv.value = "";
                document.ecdhtest.alice_pub_x.value = "";
                document.ecdhtest.alice_pub_y.value = "";
                document.ecdhtest.bob_pub_x.value = "";
                document.ecdhtest.bob_pub_y.value = "";
                document.ecdhtest.alice_key_x.value = "";
                document.ecdhtest.alice_key_y.value = "";
                document.ecdhtest.bob_key_x.value = "";
                document.ecdhtest.bob_key_y.value = "";

                do_status("Using " + name + " EC parameters");
            }

            function set_secp128r1() {
                set_ec_params("secp128r1");
            }

            function set_secp160k1() {
                set_ec_params("secp160k1");
            }

            function set_secp160r1() {
                set_ec_params("secp160r1");
            }

            function set_secp192k1() {
                set_ec_params("secp192k1");
            }

            function set_secp192r1() {
                set_ec_params("secp192r1");
            }

            function set_secp224r1() {
                set_ec_params("secp224r1");
            }

            function set_secp256r1() {
                set_ec_params("secp256r1");
            }

            var rng;

            function do_init() {
                if (document.ecdhtest.q.value.length == 0)
                    set_secp160r1();
                rng = new SecureRandom();
            }

            function get_curve() {
                return new ECCurveFp(new BigInteger(document.ecdhtest.q.value),
                        new BigInteger(document.ecdhtest.a.value),
                        new BigInteger(document.ecdhtest.b.value));
            }

            function get_G(curve) {
                return new ECPointFp(curve,
                        curve.fromBigInteger(new BigInteger(document.ecdhtest.gx.value)),
                        curve.fromBigInteger(new BigInteger(document.ecdhtest.gy.value)));
            }

            function pick_rand() {
                var n = new BigInteger(document.ecdhtest.n.value);
                var n1 = n.subtract(BigInteger.ONE);
                var r = new BigInteger(n.bitLength(), rng);
                return r.mod(n1).add(BigInteger.ONE);
            }

            function do_alice_rand() {
                var r = pick_rand();
                document.ecdhtest.alice_priv.value = r.toString();
                document.ecdhtest.alice_pub_x.value = "";
                document.ecdhtest.alice_pub_y.value = "";
                document.ecdhtest.alice_key_x.value = "";
                document.ecdhtest.alice_key_y.value = "";
                document.ecdhtest.bob_key_x.value = "";
                document.ecdhtest.bob_key_y.value = "";
                do_status("Alice's random value generated");
            }

            function do_bob_rand() {
                var r = pick_rand();
                document.ecdhtest.bob_priv.value = r.toString();
                document.ecdhtest.bob_pub_x.value = "";
                document.ecdhtest.bob_pub_y.value = "";
                document.ecdhtest.alice_key_x.value = "";
                document.ecdhtest.alice_key_y.value = "";
                document.ecdhtest.bob_key_x.value = "";
                document.ecdhtest.bob_key_y.value = "";
                do_status("Bob's random value generated");
            }

            function do_alice_pub() {
                if (document.ecdhtest.alice_priv.value.length == 0) {
                    alert("Please generate Alice's private value first");
                    return;
                }
                var before = new Date();
                var curve = get_curve();
                var G = get_G(curve);
                var a = new BigInteger(document.ecdhtest.alice_priv.value);
                var P = G.multiply(a);
                var after = new Date();
                document.ecdhtest.alice_pub_x.value = P.getX().toBigInteger().toString();
                document.ecdhtest.alice_pub_y.value = P.getY().toBigInteger().toString();
                document.ecdhtest.bob_key_x.value = "";
                document.ecdhtest.bob_key_y.value = "";
                do_status("Alice's public point computed in " + (after - before) + "ms");
            }

            function do_bob_pub() {
                if (document.ecdhtest.bob_priv.value.length == 0) {
                    alert("Please generate Bob's private value first");
                    return;
                }
                var before = new Date();
                var curve = get_curve();
                var G = get_G(curve);
                var a = new BigInteger(document.ecdhtest.bob_priv.value);
                var P = G.multiply(a);
                var after = new Date();
                document.ecdhtest.bob_pub_x.value = P.getX().toBigInteger().toString();
                document.ecdhtest.bob_pub_y.value = P.getY().toBigInteger().toString();
                document.ecdhtest.alice_key_x.value = "";
                document.ecdhtest.alice_key_y.value = "";
                do_status("Bob's public point computed in " + (after - before) + "ms");
            }

            function do_alice_key() {
                if (document.ecdhtest.alice_priv.value.length == 0) {
                    alert("Please generate Alice's private value first");
                    return;
                }
                if (document.ecdhtest.bob_pub_x.value.length == 0) {
                    alert("Please compute Bob's public value first");
                    return;
                }
                var before = new Date();
                var curve = get_curve();
                var P = new ECPointFp(curve,
                        curve.fromBigInteger(new BigInteger(document.ecdhtest.bob_pub_x.value)),
                        curve.fromBigInteger(new BigInteger(document.ecdhtest.bob_pub_y.value)));
                var a = new BigInteger(document.ecdhtest.alice_priv.value);
                var S = P.multiply(a);
                var after = new Date();
                document.ecdhtest.alice_key_x.value = S.getX().toBigInteger().toString();
                document.ecdhtest.alice_key_y.value = S.getY().toBigInteger().toString();
                do_status("Alice's key derived in " + (after - before) + "ms");
            }

            function do_bob_key() {
                if (document.ecdhtest.bob_priv.value.length == 0) {
                    alert("Please generate Bob's private value first");
                    return;
                }
                if (document.ecdhtest.alice_pub_x.value.length == 0) {
                    alert("Please compute Alice's public value first");
                    return;
                }
                var before = new Date();
                var curve = get_curve();
                var P = new ECPointFp(curve,
                        curve.fromBigInteger(new BigInteger(document.ecdhtest.alice_pub_x.value)),
                        curve.fromBigInteger(new BigInteger(document.ecdhtest.alice_pub_y.value)));
                var a = new BigInteger(document.ecdhtest.bob_priv.value);
                var S = P.multiply(a);
                var after = new Date();
                document.ecdhtest.bob_key_x.value = S.getX().toBigInteger().toString();
                document.ecdhtest.bob_key_y.value = S.getY().toBigInteger().toString();
                do_status("Bob's key derived in " + (after - before) + "ms");
            }
        //-->
        </script>
    </head>

    <body onLoad='do_init();'>
        <h1>JavaScript ECDH Key Exchange Demo</h1>

        <form name="ecdhtest" onSubmit='return false;'>
            <table>
                <tr><th>Alice</th><th>Bob</th></tr>
                <tr>
                    <td>
                        [Step 1] Alice's private value (<i>a</i>):<br>
                        <input name="alice_priv" type="text" value="" size=80><br>
                        <input type="button" value="random" onClick="do_alice_rand();"><p>
                            [Step 3] Alice's public point (<i>A = aG</i>) (X,Y):<br>
                            <input name="alice_pub_x" type="text" value="" size=80><br>
                            <input name="alice_pub_y" type="text" value="" size=80><br>
                        <input type="button" value="compute public" onClick="do_alice_pub();"><p>
                            [Step 5] Alice's secret key (<i>S = aB = abG</i>) (X,Y):<br>
                            <input name="alice_key_x" type="text" value="" size=80><br>
                            <input name="alice_key_y" type="text" value="" size=80><br>
                            <input type="button" value="derive secret" onClick="do_alice_key();">
                    </td>
                    <td>
                        [Step 2] Bob's private value (<i>b</i>):<br>
                        <input name="bob_priv" type="text" value="" size=80><br>
                        <input type="button" value="random" onClick="do_bob_rand();"><p>
                            [Step 4] Bob's public point (<i>B = bG</i>) (X,Y):<br>
                            <input name="bob_pub_x" type="text" value="" size=80><br>
                            <input name="bob_pub_y" type="text" value="" size=80><br>
                        <input type="button" value="compute public" onClick="do_bob_pub();"><p>
                            [Step 6] Bob's secret key (<i>S = bA = baG</i>) (X,Y):<br>
                            <input name="bob_key_x" type="text" value="" size=80><br>
                            <input name="bob_key_y" type="text" value="" size=80><br>
                            <input type="button" value="derive secret" onClick="do_bob_key();">
                    </td>
                </tr>
            </table>
            <p>Status:<br>
            <input name="status" type="text" size=60><p>
            <hr>
            <h2>Elliptic Curve parameters</h2><p>
                <input type="button" value="secp128r1" onClick='set_secp128r1();'>
                <input type="button" value="secp160k1" onClick='set_secp160k1();'>
                <input type="button" value="secp160r1" onClick='set_secp160r1();'>
                <input type="button" value="secp192k1" onClick='set_secp192k1();'>
                <input type="button" value="secp192r1" onClick='set_secp192r1();'>
                <input type="button" value="secp224r1" onClick='set_secp224r1();'>
                <input type="button" value="secp256r1" onClick='set_secp256r1();'>
            <p>
                Curve Q:<br>
                <input name="q" type="text" size=100><br>
                Curve A:<br>
                <input name="a" type="text" size=100><br>
                Curve B:<br>
            <input name="b" type="text" size=100><p>
                G (X,Y):<br>
                <input name="gx" type="text" size=100><br>
            <input name="gy" type="text" size=100><p>
                N:<br>
            <input name="n" type="text" size=100><p>
        </form>
        <hr>
    </body>
</html>
