package com.shine.shiro;

import com.shine.model.ysl.PubUser;
import com.shine.service.PubUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.PasswordService;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

public class MyShiroRealm extends AuthorizingRealm {

    @Resource
    private PubUserService userService;

    private PasswordService passwordService;

    public void setPasswordService(PasswordService passwordService) {
        this.passwordService = passwordService;
    }
    /**
     * 权限认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录时输入的用户名
        String loginName = (String) principalCollection.fromRealm(getName()).iterator().next();
        //到数据库查是否有此对象
        PubUser user = userService.getUserByAccountForReg(loginName);
        if (user != null) {
            //权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            //用户的角色集合
            Set<String> roles = new HashSet<>();
            roles.add("admin");
            info.setRoles(roles);
            //用户的角色对应的所有权限，如果只使用角色定义访问权限，下面的四行可以不要
            /*List<Role> roleList=user.getRoleList();
            for (Role role : roleList) {
                info.addStringPermissions(role.getPermissionsName());
            }*/
            info.addStringPermission("add");
            return info;
        }
        return null;
    }

    /**
     * 登录认证;
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {
        //UsernamePasswordToken对象用来存放提交的登录信息
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        //查出是否有此用户
        PubUser user = userService.getUserByAccountForReg(token.getUsername());
        if (user != null) {
            //若存在，将此用户存放到登录认证info中
            return new SimpleAuthenticationInfo(user.getAccount(), user.getPassword(), getName());
        }
        return null;
    }

    public static void main(String[] args) {
        String hashAlgorithmName = "MD5";
        String credentials = "123456";
        int hashIterations = 1;
        String a  = new SimpleHash(hashAlgorithmName, credentials, null, hashIterations).toString();
        System.out.println(a);
    }
}
