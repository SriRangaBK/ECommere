<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | ClickNBuy Luxury</title>

    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;1,400&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --bg: #09090b;
            --surface: #141417;
            --card: #18181c;
            --border: rgba(255, 255, 255, 0.06);
            --accent: #e5c158; 
            --accent-glow: rgba(229, 193, 88, 0.15);
            --text-primary: #f4f4f5;
            --text-secondary: #a1a1aa;
        }

        body.light {
            --bg: #faf9f6;
            --surface: #f4f3ee;
            --card: #ffffff;
            --border: rgba(0, 0, 0, 0.05);
            --accent: #8b6e2a;
            --accent-glow: rgba(139, 110, 42, 0.1);
            --text-primary: #18181b;
            --text-secondary: #71717a;
        }
	
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: var(--bg);
            color: var(--text-primary);
            font-family: 'DM Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.6s cubic-bezier(0.16, 1, 0.3, 1), color 0.6s cubic-bezier(0.16, 1, 0.3, 1);
            overflow-x: hidden;
            letter-spacing: -0.01em;
            padding: 20px;
        }

        /* --- Floating Theme Controller --- */
        .theme-fab {
            position: fixed;
            top: 30px;
            right: 30px;
            background: var(--card);
            border: 1px solid var(--border);
            color: var(--text-primary);
            width: 42px;
            height: 42px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 100;
        }
        .theme-fab:hover {
            border-color: var(--accent);
            color: var(--accent);
            transform: scale(1.05);
        }

        /* --- Architectural Luxury Login Form Container --- */
        .login-box-luxury {
            background: var(--card);
            border: 1px solid var(--border);
            width: 100%;
            max-width: 460px;
            padding: 50px 45px;
            transition: all 0.5s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
            animation: loginFadeUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }

        .login-box-luxury:hover {
            border-color: rgba(255, 255, 255, 0.12);
            box-shadow: 0 40px 80px rgba(0, 0, 0, 0.3);
        }
        body.light .login-box-luxury:hover {
            border-color: rgba(0, 0, 0, 0.1);
            box-shadow: 0 40px 80px rgba(0, 0, 0, 0.05);
        }

        /* --- Brand Typographic Frame --- */
        .brand-meta {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .brand-logo {
            font-family: 'Cormorant Garamond', serif;
            font-weight: 600;
            font-size: 1.6rem;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--text-primary);
            text-decoration: none;
            display: inline-block;
            margin-bottom: 0.5rem;
        }
        .brand-logo span {
            color: var(--accent);
        }

        .form-subtitle {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            color: var(--text-secondary);
            display: block;
        }

        /* --- Minimal Form Controls --- */
        .form-group-luxury {
            margin-bottom: 1.8rem;
            position: relative;
        }

        .label-luxury {
            font-size: 0.65rem;
            text-transform: uppercase;
            letter-spacing: 0.15em;
            color: var(--text-secondary);
            font-weight: 600;
            margin-bottom: 0.6rem;
            display: block;
        }

        .input-luxury {
            background: var(--surface) !important;
            color: var(--text-primary) !important;
            border: 1px solid var(--border) !important;
            border-radius: 0 !important;
            padding: 14px 16px !important;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            width: 100%;
        }

        .input-luxury:focus {
            box-shadow: none !important;
            border-color: var(--text-primary) !important;
        }

        /* --- Primary Luxury Interactive Button --- */
        .btn-action-submit {
            background: var(--text-primary);
            border: 1px solid var(--text-primary);
            color: var(--bg);
            padding: 14px;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            font-weight: 600;
            width: 100%;
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            margin-top: 1rem;
        }

        .btn-action-submit:hover {
            background: transparent;
            color: var(--text-primary);
            border-color: var(--text-primary);
        }

        /* --- Contextual Options Link Strip --- */
        .footer-links-strip {
            margin-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid var(--border);
            padding-top: 1.5rem;
        }

        .luxury-link {
            font-size: 0.75rem;
            color: var(--text-secondary);
            text-decoration: none;
            letter-spacing: 0.05em;
            transition: color 0.3s ease;
        }

        .luxury-link:hover {
            color: var(--accent);
        }

        @keyframes loginFadeUp {
            from { opacity: 0; transform: translateY(25px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 480px) {
            .login-box-luxury { padding: 40px 25px; }
        }
    </style>
</head>
<body>

<!-- Dynamic Theme Adjuster Floating Handle -->
<button id="themeToggle" class="theme-fab">
    <i class="bi bi-brightness-high"></i>
</button>

<div class="login-box-luxury">
    <!-- Platform Identity Header Component -->
    <div class="brand-meta">
        <a href="/" class="brand-logo">Click<span>N</span>Buy</a>
        <span class="form-subtitle">Secure Access Terminal</span>
    </div>

    <!-- Core Authorization Pipeline Form -->
    <form action="/login" method="post">
        
        <div class="form-group-luxury">
            <label class="label-luxury">Email</label>
            <input 
                type="email" 
                name="username" 
                class="form-control input-luxury" 
                value="leeChong101@gmail.com" 
                >
        </div>

        <div class="form-group-luxury">
            <label class="label-luxury">Password</label>
            <input 
                type="password" 
                name="password" 
                class="form-control input-luxury" 
                value="heehaw" 
                >
        </div>

        <button type="submit" class="btn-action-submit">
            Authenticate Identity
        </button>

    </form>

    <!-- Navigation Shortcuts Routing -->
    <div class="footer-links-strip">
        <a href="/register" class="luxury-link">Create Account</a>
        <a href="/" class="luxury-link"><i class="bi bi-arrow-left me-1"></i> Main Showroom</a>
    </div>
</div>

<script>
    /**
     * Theme Controller Context Routine
     */
    const themeController = {
        init() {
            const saved = localStorage.getItem('carsell_theme');
            if (saved === 'light') document.body.classList.add('light');
            
            document.getElementById('themeToggle').addEventListener('click', () => {
                const isLight = document.body.classList.toggle('light');
                localStorage.setItem('carsell_theme', isLight ? 'light' : 'dark');
            });
        }
    };

    // Instantiate page scripts execution context
    themeController.init();
</script>

</body>
</html>