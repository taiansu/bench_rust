use rustler::{Encoder, Env, Error, Term};
use std::ops::RangeInclusive;

mod atoms {
    rustler::rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler::rustler_export_nifs! {
    "Elixir.Ruth",
    [
        ("add", 2, add),
        ("process_list", 1, process_list),
    ],
    None
}

fn add<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let num1: i64 = args[0].decode()?;
    let num2: i64 = args[1].decode()?;

    Ok((atoms::ok(), num1 + num2).encode(env))
}

fn process_list<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let range: RangeInclusive<i32> = args[0].decode()?;
    let result: Vec<i32> = range.filter(|i| i % 2 == 0).map(|i| i * 10).collect();
    Ok(result.encode(env))
}
